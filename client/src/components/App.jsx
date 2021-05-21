import * as React from 'react';
import { useState } from 'react';
import { Route, Switch, useHistory } from 'react-router-dom';
import { Header } from './Header';
import { LeftSidebar } from './LeftSidebar';
import { ServerNavigation } from './ServerNavigation';
import { RightSidebar } from './RightSidebar';
import { MainBody } from './MainBody';

export const App = () => {
  let history = useHistory();

  return (
    <div id='page'>
      <Header />
      <LeftSidebar />
      <ServerNavigation />
      <RightSidebar />
      <MainBody />
    </div>
  );
};
