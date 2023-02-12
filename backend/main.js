import express from 'express'
import bodyparser from 'body-parser'
import admin from 'firebase-admin'
import cors from 'cors'

admin.initializeApp({
    credential: admin.credential.cert({
        projectId: process.env.FIREBASE_PROJECT_ID,
        clientEmail: process.env.SERVER_FIREBASE_CLIENT_EMAIL,
        privateKey: process.env.SERVER_FIREBASE_PRIVATE_KEY ? process.env.SERVER_FIREBASE_PRIVATE_KEY.replace(/\\n/gm, "\n") : undefined
    })
});

const app = express()
app.use(bodyparser.json())
app.use(cors({
    origin: '*'
}));

app.post('/firebase/notification', (req, res) => {
    const message = {
        data: {
            title: req.body["title"],
            body: req.body["contenu"]
        },
        notification: {
            title: "Nouvelle annonce",
            body: req.body["title"] + " - " + req.body["contenu"]
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
