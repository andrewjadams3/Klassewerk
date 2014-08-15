//= require spec_helper

describe('Students', function() {
  context('when normal user is logged in', function() {
    beforeEach(function() {

    });

    it('redirects to all posts', function() {
      var mock = sinon.mock(testHelper.lookup('route', 'index'))
      mock.expects('transitionTo').once().withExactArgs('posts');
    });
  });
});