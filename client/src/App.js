import React, { Component } from 'react';
import './App.css';
import Main from './components/Main';

class App extends Component {
    // Initialize state
    state = { quests: [] };

    componentDidMount() {
        this.getQuestsList();
    }

    getQuestsList = () => {
        fetch('/api/quests')
          .then(res => res.json())
          .then(quests => this.setState({ quests }));
    };

    render() {
        const { quests } = this.state;

        return (
          <div className="App">
              <Main/>
          </div>
        );
    }
}

export default App;