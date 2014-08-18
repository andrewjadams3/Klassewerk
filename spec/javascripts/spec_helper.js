//= require sinon
//= require application

mocha.ui('bdd');
mocha.globals(['Ember', 'DS', 'App', 'MD5']);
mocha.timeout(5);
chai.Assertion.includeStack = true;

ENV = {
  TESTING: true
};

window.server = sinon.fakeServer.create();

window.testHelper = {
  lookup: function(object, object_name) {
    name = object_name || "main";
    return App.__container__.lookup(object + ":" + name);
  }
}

App.Router.reopen({
  location: 'none'
});

Konacha.reset = Ember.K;
