# React tutorial [Link](https://www.youtube.com/watch?v=Ke90Tje7VS0)

## 1. Introduction
  * React element (Virtual DOM) -> mapped to DOM element
  * "React" to the state change and update the DOM
  * Angular is a Framework
  * React is a "View Library" of JavaScript

## 2. Set up the working enviroment

### 2.1 install `Node.js` using `npm` as well as `create-react-app`

```Shell
sudo npm i -g create-react-app@1.5.2
```

### 2.2 Getting a editor, such as Visual Stidio, WebStorm
  * 2.2.1 add `react snippet` plug-in
  * 2.2.2 add `Prettier` plug-in
  
## 3. Create a new React app

```Shell
$ mkdir Demo
$ create-react-app react-app
```

This is going to install `React` as well as all the 3rd party libraries we need:
  * a light weight development server
  * `Webpack` for bundling our files
  * `Babel` for compiling our JavaScript code
  * a bunch of other tools

The final directory:
```
react-app
├── README.md
├── package.json
├── yarn.lock
├── node_modules/
├── public/
└── src/
    ├── App.css
    ├── App.js
    ├── App.test.js
    ├── index.css
    ├── index.js
    ├── logo.svg
    └── serviceWorker.js
```

This is a zero-config setup. However, if you want to customize the environment, you can run the following. We will discuss this later.

```Shell
$ npm run eject
```

Now the app is ready to use. By typing `npm start`, this will launch a development server at http://localhost:3000/ port in a default browser.

```Shell
$ cd react-app
$ npm start
```

## 4. Explore the app we just created
> Demo/react-app/src/App.js

This is a script written in `JSX`, which represents "JavaScript XML". Inside the `return` function, a markup code piece was returned. 

To understand how this works, let's go to https://babeljs.io/repl

```JSX
function App() {
  return (
    /* This is JSX syntax */
    /* This represents the "Welcome to React" banner component */
    /* We will use Babel to interpret this code into plain JS code that browser can understand */
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}
```

Now we gonna delete all the files under `reat-app/src` and rewrite them from scratch.
* Open console in web browser `Opt` + `Cmd` + `I` (or View > Developer > Developer Tools)

```JavaScript
import React from 'react';
import ReactDOM from 'react-dom';

const element = <h1>Hello World</h1>;
console.log(element); // hot-module reloading
ReactDOM.render(element, document.getElementById('root'));
```


## 5. Build a counter app
Create a new app named `counter-app` and install `bootstrap`, which is a CSS library.

```shell
$ create-react-app counter-app
$ cd counter-app
$ npm i bootstrap@4.1.1  # bootstrap is a CSS
```



