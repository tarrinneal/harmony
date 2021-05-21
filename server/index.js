const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require('socket.io');
const io = new Server(server);

app.get('/', (req, res) => {
  debugger;
  res.sendFile('index.html', { root: __dirname + '/../public/' }, (err) => {
    if (err) {
      console.log(err);
    } else {
      console.log('sent html');
    }
  });
});

app.get('/styles.css', (req, res) => {
  res.sendFile('styles.css', { root: __dirname + '/../public/' }, (err) => {
    if (err) {
      console.log(err);
    } else {
      console.log('sent css');
    }
  });
});

app.get('/app.js', (req, res) => {
  res.sendFile('app.js', { root: __dirname + '/../public/' }, (err) => {
    if (err) {
      console.log(err);
    } else {
      console.log('sent js');
    }
  });
});

app.get('*', (req, res) => {
  res.sendFile('index.html', { root: __dirname + '/../public/' }, (err) => {
    if (err) {
      console.log(err);
    } else {
      console.log('sent html via *');
    }
  });
});

io.on('connection', (socket) => {
  console.log('a user connected');
  socket.on('disconnect', () => {
    console.log('user disconnected');
  });
});

server.listen(3000, () => {
  console.log('listening on 3000');
});
