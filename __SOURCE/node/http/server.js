// windows cmd:
// set PORT=5000
// windows powershell:
// $env:PORT=5000
// linux bash:
// export PORT=5000

const Joi = require('joi');
const express = require('express');
const app = express();

// add a piece of middleware
app.use(express.json());
app.use(express.static(__dirname + '/public'))

const courses = [
    { id: 1, name: 'course1' },
    { id: 2, name: 'course2' },
    { id: 3, name: 'course3' },
];
//courses.map(course => console.log(course.id+ " name: " + course.name))
// app.get('/', (req, res) => {
//     res.send('Hello World');
// });

app.get('/api/courses', (req, res) => {
    //res.send([1, 2, 3]);
    res.send(courses)
});

// :id -> params.id -> Parameter id

app.get('/api/courses/:id', (req, res) => {
    res.send(courses[req.params.id].name);
});


app.get('/api/courses/:year/:month', (req, res) => {
    res.send(req.params);
});


// query string parameter
// ../1?sortBy=name
app.get('/api/courses/:year/:month', (req, res) => {
    res.send(req.query);
});

app.get('/api/courses/:id', (req, res) => {
    const course = courses.find(c => c.id === parseInt(req.params.id));
    if (!course) res.status(404).send('The course with the given ID was not found.');
    res.send(course);
});

app.post('/api/courses', (req, res) => {
    if (!req.body.name || req.body.name.length < 3) {
        // 400 Bad Request
        res.status(400).send('Name is required and should be minimum 3 characters')
    }
    const course = {
        id: req.body.id,
        name: req.body.name
    };
    console.log(req.body)
    courses.push(course);
    res.send(courses);
})


/* app.post('/api/courses', (req, res) => {
    const schema = {
        name: Joi.string().min(3).required()
    };

    const result = Joi.validate(req.body, schema);
    if(result.error){
        res.status(400).send(result.error);
        return;
    }
    console.log(result);

    const course = {
        id: courses.length + 1,
        name: req.body.name
    };
    console.log(req.body)
    courses.push(course);
    res.send(courses);
}) */

app.post('/api/courses', (req, res) => {
    console.log("post" + req.params.id)
    const { error } = validateCourese(req.body); // result.error, object destructure
    if (error) return res.status(400).send(error.details[0].message);

    const course = {
        id: courses.length + 1,
        name: req.body.name
    };
    console.log(req.body)
    courses.push(course);
    res.send(courses);
})

app.put('/api/courses/:id', (req, res) => {
    console.log("put" + req.params.id)
    const course = courses.find(c => c.id === parseInt(req.params.id));
    if (!course) return res.status(404).send('The course with the given ID was not found.');

    const { error } = validateCourese(req.body); // result.error, object destructure
    if (error) return res.status(400).send(error.details[0].message);

    course.name = req.body.name;
    res.send(courses);
})

app.delete('/api/courses/:id', (req, res) => {
    console.log("delete" + req.params.id)
    const course = courses.find(c => c.id === parseInt(req.params.id));
    if (!course) return res.status(404).send('The course with the given ID was not found.');

    const index = courses.indexOf(course)
    courses.splice(index, 1)
    res.send(course)
})

function validateCourese(course) {
    const schema = {
        name: Joi.string().min(3).required()
    };
    return Joi.validate(course, schema);
}

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listening on port ${port}`));

//http://vidly.com/api/genre