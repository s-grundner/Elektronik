import logo from './logo.svg';
import './App.css';

function App(props) {

  const shoot = () => {
    alert("Button has been pressed!");
  };

  function MissedGoal() {
    return <h1>MISSED!</h1>;
  }

  function MadeGoal() {
    return <h1>GOAL!</h1>;
  }

  function Goal() {
    const isGoal = props.isGoal;
    if (isGoal) {
      return <MadeGoal />;
    }
    return <MissedGoal />;
  }


  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <button onClick={shoot}>Take the shot!</button>
      </header>
    </div >
  );
}

export default App;
