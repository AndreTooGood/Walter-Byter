// App.js

import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import LandingPage from './LandingPage';
import UserListPage from './UserListPage';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<LandingPage />} />
        <Route path="/userlist" element={<UserListPage />} />
      </Routes>
    </Router>
  );
}

export default App;
