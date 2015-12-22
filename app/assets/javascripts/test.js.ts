/*(function(app) {
  document.addEventListener('DOMContentLoaded', function() {
    ng.platform.browser.bootstrap(app.GameForm);
  });
})(window.app || (window.app = {}));*/

import {Component} from 'angular2/core';

@Component({
    selector: 'my-app',
    template: '<h1>My First Angular 2 App</h1>'
})
export class AppComponent { }

import {bootstrap}    from 'angular2/platform/browser'

bootstrap(AppComponent);