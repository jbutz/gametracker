import {bootstrap, Component, View} from 'angular2/angular2';

//Create web component in es6
@Component({
    selector: 'WelcomeApp'
})
   
//Create web view in es6
@View({
    template: '{{welcome}} Angular 2!'
})
   
//Create web  class in es6
class WebApp {
    constructor() {
        this.welcome = "Hello"
        setTimeout(() => this.welcome = 'Welcome in Angular 2 with ES6 app,', 1000);
    }
};

bootstrap(WebApp);