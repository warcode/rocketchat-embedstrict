Package.describe({
	name: 'rocketchat:embedstrict',
	version: '0.1.0',
	summary: 'HTTPS forced embedder. A limited amount of providers.',
	git: ''
});

Package.onUse(function(api) {
	api.versionsFrom('1.0');

	api.use([
		'coffeescript',
		'rocketchat:lib@0.0.1'
	]);

	api.addFiles('embedstrict.coffee', ['client']);
});

Package.onTest(function(api) {

});
