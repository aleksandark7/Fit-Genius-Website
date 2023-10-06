const connection = require("./connect.js").connection;
const express = require('express');
const app = express();
const cors = require("cors");
const port = 3600;
const bodyParser = require("body-parser");

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(cors({
  origin: '*',
  methods: ['GET', 'PUT', 'POST', 'DELETE', 'PATCH'],
  allowedHeaders: 'Content-Type'
}));

///// ADD EXERCISE //////
 
app.post('/register', (req, res) => {
  const usr_email = req.body.usr_email;
  if (usr_email === undefined) {
    res.json({ "Result": "ERR", "Message": "usr_email is mandatory" });
    return;
  }
  const usr_ime = req.body.usr_ime;
  const usr_prezime = req.body.usr_prezime;
  const usr_password = req.body.usr_password;
  const usr_godiste = req.body.usr_godiste;
  const usr_traininglevel = req.body.usr_traininglevel;
  const usr_tezina = req.body.usr_tezina;
  const usr_visina = req.body.usr_visina;
  const usr_pol = req.body.usr_pol;
  const usr_wsLevel = 1;

  connection.query(`INSERT INTO users SET  usr_ime=?, usr_prezime=?, usr_email=?, usr_password=?, usr_godiste=?, usr_traininglevel=?, usr_tezina=?, usr_visina=?, usr_pol=?, usr_wsLevel=?`,
    [usr_ime, usr_prezime, usr_email, usr_password, usr_godiste, usr_traininglevel, usr_tezina, usr_visina, usr_pol, usr_wsLevel],
    (err, results) => {
      if (err) throw err;
      console.log("User successfully added to the database");
      res.json({ "Result": "OK" });
    });
});

///// ADD EXERCISE //////

app.post("/login", (req, res) => {
  const usr_email = req.body.usr_email;
  const usr_password = req.body.usr_password;
  const usr_wsLevel = req.body.usr_wsLevel;

  if (usr_email === undefined) {
    res.json({ "Result": "ERR", "Message": "Email is invalid" });
    return;
  }

  if (usr_password === undefined) {
    res.json({ "Result": "ERR", "Message": "Password is invalid" });
    return;
  }

  connection.query(`SELECT usr_id, usr_email, usr_wsLevel, usr_ime, usr_prezime, usr_is_active FROM users
    WHERE usr_email=? AND usr_password=? AND usr_is_active = 1`,
    [usr_email, usr_password, usr_wsLevel],
    (err, results) => {
      if (err) throw err;
      if (results.length === 0) {
        res.json({ "Result": "ERR", "Message": "Login failed" });
        return;
      }
      res.json({ "Result": "OK", "data": results[0] });
    });
});

///// DISPLAY EXERCISE INFO /////

app.get("/admin/vezbe", function (req, res) {
  connection.query(`SELECT vez_id, vez_naziv, vez_opis FROM vezbe`, function (err, results) {
    if (err) throw err;
    res.json({ "data": results });
  });
});

///// DISPLAY TRAINING SYSTEMS /////

app.get("/admin/sistem", function (req, res) {
  connection.query(`SELECT sit_id, sit_naziv, sit_opis FROM sistem_treninga`, function (err, results) {
    if (err) {
      console.error(err);
      res.status(500).json({ error: "Error fetching data" });
    } else {
      res.json({ data: results });
    }
  });
});

///// DISPLAY USERS /////

app.get("/admin/users", function (req, res) {
  connection.query(`SELECT usr_id, usr_ime, usr_prezime, usr_email FROM users WHERE usr_is_active = 1`, function (err, results) {
    if (err) {
      console.error(err);
      res.status(500).json({ error: "Error fetching data" });
    } else {
      res.json({ data: results });
    }
  });
});

///// ADD EXERCISES /////

app.post('/admin/vezbe', (req, res) => {
  const vez_naziv = req.body.vez_naziv;
  if (vez_naziv === undefined) {
    res.json({ "Result": "ERR", "Message": "vez_naziv is mandatory" });
    return;
  }
  const vez_opis = req.body.vez_opis;

  connection.query(`INSERT INTO vezbe SET  vez_naziv=?, vez_opis=?`,
    [vez_naziv, vez_opis],
    (err, results) => {
      if (err) throw err;
      console.log("Exercise added successfully!");
      res.json({ "Result": "OK" });
    });
});

///// ADD TRAINING SYSTEMS /////

app.post('/admin/sistem', (req, res) => {
  const sit_naziv = req.body.sit_naziv;
  if (sit_naziv === undefined) {
    res.json({ "Result": "ERR", "Message": "sit_naziv is mandatory" });
    return;
  }
  const sit_opis = req.body.sit_opis;

  connection.query(`INSERT INTO sistem_treninga SET  sit_naziv=?, sit_opis=?, sit_issystem=0`,
    [sit_naziv, sit_opis],
    (err, results) => {
      if (err) throw err;
      console.log("Training system added successfully!");
      res.json({ "Result": "OK" });
    });
});

///// DELETE EXERCISES /////

app.delete('/admin/vezbe', (req, res) => {
  const vez_id = req.query.vez_id;

  if (!vez_id) {
    res.status(400).json({ Result: 'ERR', Message: 'vez_id is mandatory' });
    return;
  }

  connection.query(`DELETE FROM vezbe WHERE vez_id = ?`, [vez_id], (err, results) => {
    if (err) {
      console.error('Error deleting exercise:', err);
      res.status(500).json({ Result: 'ERR', Message: 'Error deleting exercise' });
      return;
    }

    console.log('Exercise successfully deleted!');
    res.json({ Result: 'OK' });
  });
});

///// DELETE TRAINING SYSTEMS /////

app.delete('/admin/sistem', (req, res) => {
  const sit_id = req.query.sit_id;

  if (!sit_id) {
    res.status(400).json({ Result: 'ERR', Message: 'sit_id is mandatory' });
    return;
  }

  connection.query('DELETE FROM sistem_treninga WHERE sit_id = ?', [sit_id], (err, results) => {
    if (err) {
      console.error('Error deleting training system:', err);
      res.status(500).json({ Result: 'ERR', Message: 'Error deleting exercise' });
      return;
    }

    console.log('Training system successfully deleted!');
    res.json({ Result: 'OK' });
  });
});

///// UPDATE USER STATUS /////

app.put('/admin/users/:id', (req, res) => {
  const usr_id = req.params.id;
  const isActive = req.body.usr_is_active;

  if (isNaN(isActive) || (isActive !== 0 && isActive !== 1)) {
    return res.status(400).json({ message: 'isActive field is mandatory and must be 0 or 1' });
  }

  connection.query(`UPDATE users SET usr_is_active = ? WHERE usr_id = ?`, [isActive, usr_id], function (err, results) {
    if (err) {
      console.error(err);
      res.status(500).json({ error: "Error updating user" });
    } else {
      if (results.affectedRows === 0) {
        res.status(404).json({ error: "User not found" });
      } else {
        res.json({ message: `User with ID ${usr_id} is ${isActive ? 'active' : 'inactive'}.` });
      }
    }
  });
});

///// DISPLAY TRAINING IN TABLE plan.html /////

app.get('/plan', (req, res) => {
  const selectedSystem = req.query.system;

  connection.query(
    `
    SELECT sistem_treninga.sit_naziv, treninzi.tre_dan FROM sistem_treninga
    JOIN treninzi ON sistem_treninga.sit_id = treninzi.sit_id
    WHERE sistem_treninga.sit_naziv = '${selectedSystem}';
    `, [selectedSystem],
    (err, results) => {
      if (err) {
        console.error('Error querying database:', err);
        res.status(500).json({ error: 'Error querying database' });
      } else {
        res.json(results);
      }
    }
  );
});

///// UPDATE SELECTED PLAN BOX /////

app.put('/update', (req, res) => {
  const selectedSystem = req.body;
  const usrId = selectedSystem.currentUser.usr_id;
  let newSitId = 0;
  selectedSystem.selPlan === 'pushPull'
    ? newSitId = 1 : selectedSystem.selPlan === 'fullBody'
      ? newSitId = 2 : selectedSystem.selPlan === 'upperLower'
        ? newSitId = 10 : newSitId = 4;

  connection.query(`UPDATE users SET users.sit_id = ${newSitId} WHERE users.usr_id = ${usrId}`, (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).json({ error: 'Error updating user' });
    } else {
      if (results.affectedRows === 0) {
        res.status(404).json({ error: 'User not found' });
      } else {
        res.json({ message: `User with ID ${usrId} updated successfully` });
      }
    }
  });
});

///// DISPLAY EXERCISES IN training.html /////

app.get('/training/:day', (req, res) => {
  const day = req.params.day;
  const system = req.query.system;

  connection.query(
    `
    SELECT vezbe.vez_naziv, vezbe_treninzi.vtr_serija1, vezbe_treninzi.vtr_serija2, vezbe_treninzi.vtr_serija3 
    FROM vezbe 
    JOIN vezbe_treninzi ON vezbe.vez_id = vezbe_treninzi.vez_id
    JOIN treninzi ON vezbe_treninzi.tre_id = treninzi.tre_id
    JOIN sistem_treninga ON treninzi.sit_id = sistem_treninga.sit_id
    WHERE treninzi.tre_dan = ${day} AND sistem_treninga.sit_naziv = '${system}';
    `, [day], 
    (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).json({ error: "Error fetching data" });
    } else {
      res.json({ data: results });
    }
  });
});

///// DISPLAY TRAINING FINISHED IN dashboard.html /////

app.get('/dashboard/:usr_id', (req, res) => {
  const korisnikId = req.params.usr_id;

  connection.query(
  `
  SELECT treninzi.tre_finished, treninzi.tre_dan FROM users
  JOIN sistem_treninga ON users.sit_id = sistem_treninga.sit_id
  JOIN treninzi ON sistem_treninga.sit_id = treninzi.sit_id
  WHERE users.usr_id =  ${korisnikId};
  `, [korisnikId],
   (err, results) => {
    if (err) {
      console.error('Error querying database:', err);
      res.status(500).json({ error: 'Error querying database' });
    } else {
      res.json(results);
    }
  });
});

///// UPDATE TRAINING STATUS FINISHED /////

app.put('/dashboard/put/:id', (req, res) => {
  const treId = req.params.id;
  const finished = req.body.tre_finished;

  connection.query(
    `UPDATE treninzi SET tre_finished = ${finished} WHERE tre_dan = ${treId}`,
    [finished, treId],
    function (err, results) {
      if (err) {
        console.error(err);
        res.status(500).json({ error: "Error updating training" });
      } else {
        if (results.affectedRows === 0) {
          res.status(404).json({ error: "Training not found" });
        } else {
          res.status(200).json({ message: "Training status updated" });
        }
      }
    }
  );
});

///// FETCHING PROFILE INFO /////

app.get('/dashboard/profile/:id', (req, res) => {
  const userId = req.params.id;
  connection.query(
    `SELECT users.usr_visina, users.usr_tezina, users.usr_traininglevel, users.sit_id, users.usr_datumsistem, sistem_treninga.sit_naziv FROM users JOIN sistem_treninga
    ON users.sit_id = sistem_treninga.sit_id WHERE users.usr_id = ${userId}`,
    [userId],
    (err, results) => {
      if (err) {
        console.error('Error fetching user profile:', err);
        res.status(500).json({ error: 'Error fetching user profile' });
      } else {
        if (results.length === 0) {
          res.status(404).json({ error: 'User profile not found' });
        } else {
          res.status(200).json(results[0]);
        }
      }
    }
  );
});

///// APP LISTEN /////

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});


