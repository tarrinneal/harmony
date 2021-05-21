import * as React from 'react';
import { useState } from 'react';
import { ServerNavigation } from './ServerNavigation';
import { RightSidebar } from './RightSidebar';
import { MainBody } from './MainBody';

export const Server = () => {
  return (
    <div id='server'>
      <ServerNavigation />
      <MainBody />
      <RightSidebar />
    </div>
  );
};
