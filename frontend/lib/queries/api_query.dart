String whoami = r"""
	{
		whoami {
			username
			id
		}
	}
""";

String createdCourses = r"""
	{
		createdCourses {
			id
			name
			description
			privacyType
		}
	}
""";

String learningBlocksForUser = r"""
	{
		learningBlocksForUser {
			learningBlockId {
				subunitId {
					unitId {
						courseId {
							id
							name
							description
						}
					}
				}
				semanticName
				semanticDescription
			}
		}
	}
""";
		
String watchedCourses = r"""
	{
		watchedCourses {
			courseId {
				id
				creatorId {
					username
				}
				name
				description
			}
		}
	}
""";
	
String favoritedCourses = r"""
	{
		favoritedCourses {
			courseId {
				id
				creatorId {
					username
				}
				name
				description
			}
		}
	}
""";

String enrolledCourses = r"""
	{
		enrolledCourses {
			courseId {
				id
				creatorId {
					username
				}
				name
				description
			}
		}
	}
""";

String learningBlocksForUserFromCourse = r"""
	query BlocksForUserFromCourse($courseId: ID!) {
		learningBlocksForUserFromCourse(courseId: $courseId)
		{
			learningBlockId {
				subunitId {
					id
					unitId {
						id
					}
				}
				semanticName
				semanticDescription
			}
		}
	}
""";

String userFromId = r"""
	query UserFromId($id: ID!) {
		userFromId(userId: $id)
		{
			username
			dateJoined
			lastLogin
			description
		}
	}
""";

String coursesCreatedByUser = r"""
	query CoursesCreatedByUser($id: ID!) {
		coursesCreatedByUser(userId: $id)
		{
			id
			name
			description
		}
	}
""";
	
String courseFromId = r"""
	query CourseFromId($id: ID!) {
		courseFromId(courseId: $id)
		{
			name
			description
			creationDate
			lastUpdate
			creatorId {
				id
				username
			}
		}
	}
""";
	
String unitsFromCourse = r"""
	query UnitsFromCourse($id: ID!) {
		unitsFromCourse(courseId: $id)
		{
			name
			description
		}
	}
""";
	
String subunitsFromUnit = r"""
	query SubunitsFromUnit($id: ID!) {
		subunitsFromUnit(unitId: $id)
		{
			name
			description
		}
	}
""";
	
String learningBlocksFromSubunit = r"""
	query LearningBlocksFromSubunit($id: ID!) {
		learningBlocksFromSubunit(unitId: $id)
		{
			semanticName
			semanticDescription
		}
	}
""";

String searchCourses = r"""
	query SearchCourses($searchText: String!) {
		searchCourses(searchText: $searchText)
		{
			id
			creatorId {
				username
			}
			name
			description
		}
	}
""";
