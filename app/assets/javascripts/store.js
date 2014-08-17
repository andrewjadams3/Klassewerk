App.Store = DS.Store.extend({

});

App.ApplicationAdapter = DS.ActiveModelAdapter.extend({

});

// Override the default adapter with the `DS.ActiveModelAdapter` which
// is built to work nicely with the ActiveModel::Serializers gem.

DS.RESTAdapter.reopen({
  namespace: 'api/v1'
})

App.RawTransform = DS.Transform.extend({
  serialize: function(deserialized) {
    return unserialized;
  },
  deserialize: function(serialized) {
    return serialized;
  }
});

App.register('transform:raw', App.RawTransform);      
