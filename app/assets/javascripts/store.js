// App.Store = DS.Store.extend({

// });

// Override the default adapter with the `DS.ActiveModelAdapter` which
// is built to work nicely with the ActiveModel::Serializers gem.
// App.ApplicationAdapter = DS.FixtureAdapter.extend({

// });

// DS.RESTAdapter.reopen({
//   namespace: 'api/v1'
// })

App.Store = DS.Store.extend({
  adapter: 'Fixture'
});

App.FixtureAdapter = DS.FixtureAdapter.extend({
  queryFixtures : function(fixtures, query, type) {
      return fixtures.filter(function(item) {
          for (prop in query) {
              var intValue = parseInt(query[prop]);
              if (item[prop] instanceof Array) {
                  var result = false;
                  item[prop].forEach(function(element) {
                      if (typeof element === 'number') {
                          if (intValue == element) {
                              result = true;
                          }
                      } else {
                          if (element.id == intValue) {
                              result = true;
                          }
                      }
                  });
                  return result;
              } else {
                  return (item[prop] != query[prop]);
              }
          }
          return true;
      });
  }
});


