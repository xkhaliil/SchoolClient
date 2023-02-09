import express from 'express'
import bodyparser from 'body-parser'
import admin from 'firebase-admin'
import serviceAccount from './certificate/firebase.json' assert {type: "json"};

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const app = express()
app.use(bodyparser.json())

app.post('/firebase/notification', (req, res) => {
    //const message = req.body.message

    const message = {
        data: {
            title: req.data.title,
            body: req.data.body
        },
        topic: "annonce"
    };

    admin.messaging().send(message)
        .then(response => {
            res.status(200).send("Notification sent successfully")
        })
        .catch(error => {
            console.log(error);
        });

})

app.listen(3000, () => {
    console.log("listening to port 3000")
})
