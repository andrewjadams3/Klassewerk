// App.Store = DS.Store.extend({

// });

// Override the default adapter with the `DS.ActiveModelAdapter` which
// is built to work nicely with the ActiveModel::Serializers gem.
// App.ApplicationAdapter = DS.FixtureAdapter.extend({

// });

// DS.RESTAdapter.reopen({
//   namespace: 'api/v1'
// })

App.ApplicationAdapter = DS.FixtureAdapter.extend({
  queryFixtures: function(records, query, type) {
    return records.filter(function(record) {
        for(var key in query) {
            if (!query.hasOwnProperty(key)) { continue; }
            var value = query[key];
            if (record[key] !== value) { return false; }
        }
        return true;
    });
  }
});


App.Store = DS.Store.extend({
  adapter: 'Fixture'
});