﻿Feature: Generating HTML report from NUnit execution result
	In order to present the test results in a nice form
	As a test manager
	I want to be able to generate an HTML report from the NUnit execution result

Scenario: Summary is included in the HTML result
	Given there are NUuit test execution results for the ReportingTest.SampleProject project
	When I generate SpecFlow NUnit execution report
	Then a report generated containing
	"""
		Summary 
		Features	Success rate	Scenarios	Success		Failed	Pending		Ignored 
		2 features	40%				5			2			1		1			1 
	"""


Scenario: Feature summary is included in the HTML result
	Given there are NUuit test execution results for the ReportingTest.SampleProject project
	When I generate SpecFlow NUnit execution report
	Then a report generated containing
	"""
		Feature Summary
		Feature								Success rate	Scenarios	Success		Failed	Pending		Ignored		
		Feature with failing scenarios		0%				3			0			1		1			1
		Feature with successful scenarios	100%			2			2			0		0			0
	"""


Scenario: Successful test output is included in the HTML result
	Given there are NUuit test execution results for the ReportingTest.SampleProject project
	When I generate SpecFlow NUnit execution report
	Then a report generated containing
	"""
		Given I have a precondition that is successful
		-> done: StepDefinitions.GivenIHaveAPreconditionThatIs("successful") (0,0s)
		When I do something that works
		-> done: StepDefinitions.GivenIHaveAPreconditionThatIs("works") (0,0s)
		Then I have a postcondition that is successful
		-> done: StepDefinitions.GivenIHaveAPreconditionThatIs("successful") (0,0s)
	"""


Scenario: Pending test output is included in the HTML result
	Given there are NUuit test execution results for the ReportingTest.SampleProject project
	When I generate SpecFlow NUnit execution report
	Then a report generated containing
	"""
		Given I have a pending precondition
		-> No matching step definition found for the step. Use the following code to create one:
			[Binding]
			public class StepDefinitions
			{
				[Given(@"I have a pending precondition")]
				public void GivenIHaveAPendingPrecondition()
				{
					ScenarioContext.Current.Pending();
				}
			}
	"""


Scenario: Failing test output is included in the HTML result
	Given there are NUuit test execution results for the ReportingTest.SampleProject project
	When I generate SpecFlow NUnit execution report
	Then a report generated containing
	"""
		Given I have a precondition that is failing
		-> error: simulated failure
	"""


Scenario: Failing test exception is included in the HTML result
	Given there are NUuit test execution results for the ReportingTest.SampleProject project
	When I generate SpecFlow NUnit execution report
	Then a report generated containing
	"""
simulated failure
at ReportingTest.SampleProject.StepDefinitions.GivenIHaveAPreconditionThatIs(String result) in 
	"""
