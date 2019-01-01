import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';


const endpoint = 'https://{api_gate_way}'

class App extends Component {
  constructor() {
      super();
      this.state = {items: []};
  }

  componentDidMount() {
    fetch(endpoint)
      .then((response) => response.json())
      .then((responseJson) => {
        console.log("data: " + JSON.stringify(responseJson));
        this.setState({items: responseJson}); 
      });
  }

  render() {
    const rows = this.state.items.map((item, index) => <tr key={index}><td>{item.name}</td></tr>);
    return (
      <div className="App">
        <div className="App-header">
          <table>
            <tbody>
              {rows}
            </tbody>
          </table>
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to React</h2>
        </div>
      </div>
    );
  }
}

export default App;
