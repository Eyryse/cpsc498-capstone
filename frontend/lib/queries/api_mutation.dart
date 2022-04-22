String registerUser = r"""
	mutation RegisterUser($email: String!, $username: String!, $password: String!) {
		registerUser(userData: {
			email: $email
			username: $username
			password: $password
		})
		{
			user {
				username
				id
			}
			url {
				nextUrl
			}
		}
	}
""";
	
String loginUser = r"""
	mutation LoginUser($email: String!, $password: String!) {
		loginUser(userData: {
			email: $email
			username: $email
			password: $password
		})
		{
			user {
				username
				id
			}
			url {
				nextUrl
			}
		}
	}
""";
	
String logoutUser = r"""
	mutation {
		logoutUser
		{
			url {
				nextUrl
			}
		}
	}
""";

String changeUserPassword = r"""
	mutation ChangeUserPassword($password: String!) {
		changeUserPassword(userData: {
			password: $password
		})
		{
			user {
				id
			}
		}
	}
""";
	
String forgotPassword = r"""
	mutation ForgotPassword($email: String!) {
		forgotPassword(userData: {
			email: $email
		})
		{
			user {
				id
				username
			}
		}
	}
""";

String createCourse = r"""
	mutation CreateCourse($name: String!, $description: String!, $privacyType: String!) {
		createCourse(courseData: {
			name: $name
			description: $description
			privacyType: $privacyType
		})
		{
			url {
				nextUrl
			}
		}
	}
""";

String updateCourse = r"""
	mutation UpdateCourse($id: ID!, $name: String, $description: String, $privacyType: String) {
		updateCourse(courseData: {
			id: $id
			name: $name
			description: $description
			privacyType: $privacyType
		})
		{
			url {
				nextUrl
			}
		}
	}
""";

String deleteCourse = r"""
	mutation DeleteCourse($id: ID!) {
		deleteCourse(courseData: {
			id: $id
		})
		{
			url {
				nextUrl
			}
		}
	}
""";

String favoriteCourse = r"""
	 mutation FavoriteCourse($courseId: ID!) {
		favoriteCourse(favoriteCourseData: {
			courseId: $courseId
		})
		{
			favoriteCourse {
				id
			}
		}
	}
""";
	
String unfavoriteCourse = r"""
	mutation UnfavoriteCourse($courseId: ID!) {
		unfavoriteCourse(favoriteCourseData: {
			courseId: $courseId
		})
		{
			favoriteCourse {
				id
			}
		}
	}
""";

String watchCourse = r"""
	mutation WatchCourse($courseId: ID!) {
		watchCourse(watchedCourseData: {
			courseId: $courseId
		})
		{
			watchedCourse {
				id
			}
		}
	}
""";
	
String unwatchCourse = r"""
	mutation UnwatchCourse($courseId: ID!) {
		unwatchCourse(watchedCourseData: {
			courseId: $courseId
		})
		{
			watchedCourse {
				id
			}
		}
	}
""";

String enrollCourse = r"""
	mutation EnrollCourse($courseId: ID!) {
		enrollCourse(enrollCourseData: {
			courseId: $courseId
		})
		{
			enrollCourse {
				id
			}
		}
	}
""";
	
String unenrollCourse = r"""
	mutation UnenrollCourse($courseId: ID!) {
		unenrollCourse(enrollCourseData: {
			courseId: $courseId
		})
		{
			enrollCourse {
				id
			}
		}
	}
""";

String addUnitToCourse = r"""
	mutation AddUnit($courseId: ID!, $name: String!, $description: String!) {
		addUnitToCourse(unitData: {
			courseId: $courseId
			name: $name
			description: $description
		})
		{
			url {
				nextUrl
			}
		}
	}
""";
	
String removeUnitFromCourse = r"""
	mutation DeleteUnit($id: ID!) {
		removeUnitFromCourse(unitData: {
			id: $id
		})
		{
			url {
				nextUrl
			}
		}
	}
""";

String addSubunitToUnit = r"""
	mutation AddSubunit($unitId: ID!, $name: String!, $description: String!) {
		addSubunitToUnit(subunitData: {
			unitId: $unitId
			name: $name
			description: $description
		})
		{
			url {
				nextUrl
			}
		}
	}
""";
	
String removeSubunitFromUnit = r"""
	mutation DeleteSubunit($id: ID!) {
		removeSubunitFromUnit(subunitData: {
			id: $id
		})
		{
			url {
				nextUrl
			}
		}
	}
""";

String addLearningBlockToSubunit = r"""
	mutation AddSubunit($subunitId: ID!, $semanticName: String!, $semanticDescription: String!) {
		addLearningBlockToSubunit(learningBlockData: {
			subunitId: $subunitId
			semanticName: $semanticName
			semanticDescription: $semanticDescription
		})
		{
			url {
				nextUrl
			}
		}
	}
""";
	
String removeLearningBlockFromSubunit = r"""
	mutation DeleteLearningBlock($id: ID!) {
		removeLearningBlockFromSubunit(learningBlockData: {
			id: $id
		})
		{
			url {
				nextUrl
			}
		}
	}
""";

String addTestToSubunit = r"""
	mutation AddTest($subunitId: ID!, $testType: String!, $questionAmount: Int!) {
		addTestToSubunit(testData: {
			subunitId: $subunitId
			testType: $testType
			questionAmount: $questionAmount
		})
		{
			url {
				nextUrl
			}
		}
	}
""";
	
String removeTestFromSubunit = r"""
	mutation DeleteTest($id: ID!) {
		removeTestFromSubunit(testData: {
			id: $id
		})
		{
			url {
				nextUrl
			}
		}
	}
""";

String addQuestionToTest = r"""
	mutation AddQuestion($testId: ID!, $duration: Int!, $description: String!, $questionType: String!) {
		addQuestionToTest(questionData: {
			testId: $testId
			duration: $duration
			description: $description
			questionType: $questionType
		})
		{
			url {
				nextUrl
			}
		}
	}
""";
	
String removeQuestionFromTest = r"""
	mutation DeleteQuestion($id: ID!) {
		removeQuestionFromTest(questionData: {
			id: $id
		})
		{
			url {
				nextUrl
			}
		}
	}
""";
