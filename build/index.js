const express = require('express');
const app = express();

app.get('*', function (req, res) {
    res.send({status: 'ok'});
});

app.get('/status', function (req, res) {
    res.send({status: 'ok'});
});

app.listen(3000);
