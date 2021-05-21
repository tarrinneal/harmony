import * as React from 'react';
import { useState } from 'react';
import { Route, Switch, useHistory } from 'react-router-dom';
import { Header } from './Header';

export const App = () => {
  let history = useHistory();

  return (
    <div id='page'>
      <Header />
    </div>
  );
};
