/**
 * Create a new TestBox test browser for an application. The test browser will be created in a directory called tests/test-browser.
 * .
 * You can run it from the root of your application.
 * {code:bash}
 * testbox create browser
 * {code}
 * .
 * Or pass the base directory of your application as a parameter
 * {code:bash}
 * testbox create browser C:\myApp
 * {code}
 */
component extends="testboxCLI.models.BaseCommand"{

	/**
	 * @directory The base directory to create your test browser
	 * @boxlang   Is this a boxlang project? else it is a CFML project
	 */
	function run(
		string directory = getCWD(),
		boolean boxlang = isBoxLangProject( getCWD() )
	){
		// This will make each directory canonical and absolute
		arguments.directory = resolvePath( arguments.directory & "/tests/browser" );

		// Validate directory
		if ( !directoryExists( arguments.directory ) ) {
			directoryCreate( arguments.directory );

			// Copy template from testbox source
			directoryCopy(
				"#variables.settings.templatesPath#/#arguments.boxlang ? 'bx' : 'cfml'#/browser/",
				arguments.directory,
				true
			);

			// Print the results to the console
			print.greenLine( "Created " & arguments.directory );
		} else {
			error( "Directory #arguments.directory# already exists!" );
		}
	}

}
