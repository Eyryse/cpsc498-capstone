import graphene

from database.models import *
from django.contrib.auth import get_user_model, authenticate, login, logout
from backend.api.schema_types import *

class UserInput(graphene.InputObjectType):
	id = graphene.ID()
	username = graphene.String()
	email = graphene.String()
	password = graphene.String()
			
class CourseInput(graphene.InputObjectType):
	id = graphene.ID()
	privacy_type = graphene.String()
	name = graphene.String()
	description = graphene.String()
	
class CourseUserRelationshipInput(graphene.InputObjectType):
	id = graphene.ID()
	course_id = graphene.ID()
	user_id = graphene.ID()
	
class UnitInput(graphene.InputObjectType):
	id = graphene.ID()
	course_id = graphene.ID()
	name = graphene.String()
	description = graphene.String()
	
class SubUnitInput(graphene.InputObjectType):
	id = graphene.ID()
	unit_id = graphene.ID()
	name = graphene.String()
	description = graphene.String()
	
class LearningBlockInput(graphene.InputObjectType):
	id = graphene.ID()
	subunit_id = graphene.ID()
	semantic_name = graphene.String()
	semantic_description = graphene.String()
	
class TestInput(graphene.InputObjectType):
	id = graphene.ID()
	subunit_id = graphene.ID()
	test_type = graphene.String()
	question_amount = graphene.Int()
	
class QuestionInput(graphene.InputObjectType):
	id = graphene.ID()
	test_id = graphene.ID()
	question_type = graphene.String()
	description = graphene.String()
	duration = graphene.Int()
	
class RegisterUser(graphene.Mutation):
	class Arguments:
		user_data = UserInput(required=True)
		
	user = graphene.Field(UserType)
	
	@staticmethod
	def mutate(root, info, user_data=None):
		user_instance = get_user_model()(
			username = user_data.username,
			email = user_data.email
		)
		user_instance.set_password(user_data.password)
		user_instance.save()
		return RegisterUser(user=user_instance)
		
class LoginUser(graphene.Mutation):
	class Arguments:
		user_data = UserInput(required=True)
		
	user = graphene.Field(UserType)
	url = graphene.Field(UrlRedirectType)
	
	@staticmethod
	def mutate(root, info, user_data=None):
		user = authenticate(username=user_data.email, password=user_data.password)
		if (user is not None):
			login(info.context, user)
			url_instance = UrlRedirect(next_url='127.0.0.1:8000/login')
			return LoginUser(user=user, url=url_instance)
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		return LoginUser(user=None, url=url_instance)
		
class LogoutUser(graphene.Mutation):
	class Arguments:
		pass
		
	url = graphene.Field(UrlRedirectType)
	
	@staticmethod
	def mutate(root, info):
		if (info.context.user.is_authenticated):
			logout(info.context)
			url_instance = UrlRedirect(next_url='127.0.0.1:8000/logout')
			return LogoutUser(url=url_instance)
		return LogoutUser(url=None)
		
class ChangePassword(graphene.Mutation):
	class Arguments:
		user_data = UserInput(required=True)
		
	user = graphene.Field(UserType)
	
	@staticmethod
	def mutate(root, info, user_data=None):
		if (info.context.user.is_authenticated):
			user_instance = get_user_model().objects.get(pk=info.context.user.id)
			user_instance.set_password(user_data.password)
			user_instance.save()
			return ChangePassword(user=user_instance)
		return ChangePassword(user=None)
		
class ForgotPassword(graphene.Mutation):
	class Arguments:
		user_data = UserInput(required=True)
		
	user = graphene.Field(UserType)
	
	@staticmethod
	def mutate(root, info, user_data=None):
		user_instance = get_user_model().objects.get(email=user_data.email)
		return ForgotPassword(user=user_instance)
		
class LoginUser(graphene.Mutation):
	class Arguments:
		user_data = UserInput(required=True)
		
	user = graphene.Field(UserType)
	url = graphene.Field(UrlRedirectType)
	
	@staticmethod
	def mutate(root, info, user_data=None):
		user = authenticate(username=user_data.email, password=user_data.password)
		if (user is not None):
			login(info.context, user)
			url_instance = UrlRedirect(next_url='127.0.0.1:8000/login')
			return LoginUser(user=user, url=url_instance)
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		return LoginUser(user=None, url=url_instance)
		
class LogoutUser(graphene.Mutation):
	class Arguments:
		pass
		
	url = graphene.Field(UrlRedirectType)
	
	@staticmethod
	def mutate(root, info):
		if (info.context.user.is_authenticated):
			logout(info.context)
			url_instance = UrlRedirect(next_url='127.0.0.1:8000/logout')
			return LogoutUser(url=url_instance)
		return LogoutUser(url=None)
	
class CreateCourse(graphene.Mutation):
	class Arguments:
		course_data = CourseInput(required=True)
		
	course = graphene.Field(CourseType)
	url = graphene.Field(UrlRedirectType)
	
	@staticmethod
	def mutate(root, info, course_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			course_instance = Course(
				creator_id = info.context.user,
				privacy_type = course_data.privacy_type,
				name = course_data.name,
				description = course_data.description
			)
			course_instance.save()
			url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
			return CreateCourse(course=course_instance, url=url_instance)
		return CreateCourse(course=None, url=url_instance)
		
class UpdateCourse(graphene.Mutation):
	class Arguments:
		course_data = CourseInput(required=True)
		
	course = graphene.Field(CourseType)
	url = graphene.Field(UrlRedirectType)
	
	@staticmethod
	def mutate(root, info, course_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				course_instance = Course.objects.get(pk=course_data.id)
				if (course_instance):
					if (course_instance.creator_id.id == info.context.user.id):
						if (course_data.privacy_type is not None):
							course_instance.privacy_type = course_data.privacy_type
						if (course_data.name is not None):
							course_instance.name = course_data.name
						if (course_data.description is not None):
							course_instance.description = course_data.description
						course_instance.save()
						url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
						return UpdateCourse(course=course_instance, url=url_instance)
			except Course.DoesNotExist:
				return UpdateCourse(course=None,url=url_instance)
		return UpdateCourse(course=None,url=url_instance)
		
class DeleteCourse(graphene.Mutation):
	class Arguments:
		course_data = CourseInput(required=True)

	course = graphene.Field(CourseType)
	url = graphene.Field(UrlRedirectType)
	
	@staticmethod
	def mutate(root, info, course_data=None):
		if (info.context.user.is_authenticated):
			try:
				course_instance = Course.objects.get(pk=course_data.id)
				if (course_instance):
					if (course_instance.creator_id.id == info.context.user.id):
						course_instance.delete()
						url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
						return DeleteCourse(course=None, url=url_instance)
			except Course.DoesNotExist:
				url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
				return DeleteCourse(course=None, url=url_instance)
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
		return DeleteCourse(course=None,url=url_instance)
		
class FavoritingCourse(graphene.Mutation):
	class Arguments:
		favorite_course_data = CourseUserRelationshipInput(required=True)
	
	favorite_course = graphene.Field(FavoriteCourseType)
	
	@staticmethod
	def mutate(root, info, favorite_course_data=None):
		if (info.context.user.is_authenticated):
			try:
				course_instance = Course.objects.get(pk=favorite_course_data.course_id)
				favorite_course_instance = FavoriteCourse(
					user_id = info.context.user,
					course_id = course_instance
				)
				favorite_course_instance.save()
				return FavoritingCourse(favorite_course=favorite_course_instance)
			except Course.DoesNotExist:
				return FavoritingCourse(favorite_course=None)
		return FavoritingCourse(favorite_course=None)
	
class UnfavoritingCourse(graphene.Mutation):
	class Arguments:
		favorite_course_data = CourseUserRelationshipInput(required=True)

	favorite_course = graphene.Field(FavoriteCourseType)
	
	@staticmethod
	def mutate(root, info, favorite_course_data=None):
		if (info.context.user.is_authenticated):
			try:
				favorite_instance = FavoriteCourse.objects.get(
					user_id=info.context.user.id,
					course_id=favorite_course_data.course_id
				)
				favorite_instance.delete()
				return FavoritingCourse(favorite_course=None)
			except FavoriteCourse.DoesNotExist:
				return FavoritingCourse(favorite_course=None)
		return FavoritingCourse(favorite_course=None)
		
class WatchingCourse(graphene.Mutation):
	class Arguments:
		watched_course_data = CourseUserRelationshipInput(required=True)
	
	watched_course = graphene.Field(WatchCourseType)
	
	@staticmethod
	def mutate(root, info, watched_course_data=None):
		if (info.context.user.is_authenticated):
			try:
				course_instance = Course.objects.get(pk=watched_course_data.course_id)
				watch_course_instance = WatchCourse(
					user_id = info.context.user,
					course_id = course_instance
				)
				watch_course_instance.save()
				return WatchingCourse(watched_course=watch_course_instance)
			except Course.DoesNotExist:
				return WatchingCourse(watched_course=None)
		return WatchingCourse(watched_course=None)
	
class UnwatchingCourse(graphene.Mutation):
	class Arguments:
		watched_course_data = CourseUserRelationshipInput(required=True)

	watched_course = graphene.Field(WatchCourseType)
	
	@staticmethod
	def mutate(root, info, watched_course_data=None):
		if (info.context.user.is_authenticated):
			try:
				watch_instance = WatchCourse.objects.get(
					user_id=info.context.user.id,
					course_id=favorite_course_data.course_id
				)
				watch_instance.delete()
			except WatchCourse.DoesNotExist:
				return UnwatchingCourse(watched_course=None)
		return UnwatchingCourse(watched_course=None)
		
class EnrollInCourse(graphene.Mutation):
	class Arguments:
		enroll_course_data = CourseUserRelationshipInput(required=True)
	
	enroll_course = graphene.Field(EnrolledCourseType)
	
	@staticmethod
	def mutate(root, info, enroll_course_data=None):
		if (info.context.user.is_authenticated):
			try:
				course_instance = Course.objects.get(pk=enroll_course_data.course_id)
				enroll_course_instance = EnrolledCourse(
					user_id = info.context.user,
					course_id = course_instance
				)
				enroll_course_instance.save()
				return EnrollInCourse(enroll_course=enroll_course_instance)
			except Course.DoesNotExist:
				return EnrollInCourse(enroll_course=None)
		return EnrollInCourse(enroll_course=None)
		
class WithdrawFromCourse(graphene.Mutation):
	class Arguments:
		enroll_course_data = CourseUserRelationshipInput(required=True)

	enroll_course = graphene.Field(EnrolledCourseType)
	
	@staticmethod
	def mutate(root, info, enroll_course_data=None):
		if (info.context.user.is_authenticated):
			try:
				enroll_instance = EnrolledCourse.objects.get(
					user_id = info.context.user.id,
					course_id = enroll_course_data.course_id
				)
				enroll_instance.delete()
			except EnrolledCourse.DoesNotExist:
				return WithdrawFromCourse(enroll_course=None)
		return WithdrawFromCourse(enroll_course=None)
		
class AddUnitToCourse(graphene.Mutation):
	class Arguments:
		unit_data = UnitInput(required=True)
		
	unit = graphene.Field(UnitType)
	url = graphene.Field(UrlRedirectType)
		
	@staticmethod
	def mutate(root, info, unit_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				course_instance = Course.objects.get(pk=unit_data.course_id)
				if (info.context.user.id == course_instance.creator_id.id):
					unit_instance = Unit(
						course_id = course_instance,
						name = unit_data.name,
						description = unit_data.description
					)
					unit_instance.save()
					url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
					return AddUnitToCourse(unit=unit_instance,url=url_instance)
			except Course.DoesNotExist:
				return AddUnitToCourse(unit=None,url=url_instance)
		return AddUnitToCourse(unit=None,url=url_instance)

class RemoveUnitFromCourse(graphene.Mutation):
	class Arguments:
		unit_data = UnitInput(required=True)
		
	unit = graphene.Field(UnitType)
	url = graphene.Field(UrlRedirectType)
		
	@staticmethod
	def mutate(root, info, unit_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				unit_instance = Unit.objects.get(pk=unit_data.id)
				try:
					course_instance = Course.objects.get(pk=unit_instance.course_id)
					url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
					if (info.context.user.id == course_instance.creator_id.id):
						unit_instance.delete()
						return RemoveUnitFromCourse(unit=None,url=url_instance)
				except Course.DoesNotExist:
					return RemoveUnitFromCourse(unit=None,url=url_instance)
			except Unit.DoesNotExist:
				return RemoveUnitFromCourse(unit=None,url=url_instance)
		return RemoveUnitFromCourse(unit=None,url=url_instance)

class AddSubunitToUnit(graphene.Mutation):
	class Arguments:
		subunit_data = SubUnitInput(required=True)
		
	subunit = graphene.Field(SubUnitType)
	url = graphene.Field(UrlRedirectType)
		
	@staticmethod
	def mutate(root, info, subunit_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				unit_instance = Unit.objects.get(pk=subunit_data.unit_id)
				try:
					course_instance = Course.objects.get(pk=unit_instance.course_id)
					url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
					if (info.context.user.id == course_instance.creator_id.id):
						subunit_instance = SubUnit(
							unit_id = unit_instance,
							name = subunit_data.name,
							description = subunit_data.description
						)
						subunit_instance.save()
						return AddSubunitToUnit(subunit=subunit_instance,url=url_instance)
				except Course.DoesNotExist:
					return AddSubunitToUnit(subunit=None,url=url_instance)
			except Unit.DoesNotExist:
				return AddSubunitToUnit(subunit=None,url=url_instance)
		return AddSubunitToUnit(subunit=None,url=url_instance)

class RemoveSubunitFromUnit(graphene.Mutation):
	class Arguments:
		subunit_data = SubUnitInput(required=True)
		
	subunit = graphene.Field(SubUnitType)
	url = graphene.Field(UrlRedirectType)
		
	@staticmethod
	def mutate(root, info, subunit_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				subunit_instance = SubUnit.objects.get(pk=subunit_data.id)
				try:
					unit_instance = Unit.objects.get(pk=subunit_instance.unit_id.id)
					try:
						course_instance = Course.objects.get(pk=unit_instance.course_id.id)
						url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
						if (info.context.user.id == course_instance.creator_id.id):
							subunit_instance.delete()
							return RemoveSubunitFromUnit(subunit=None,url=url_instance)
					except Course.DoesNotExist:
						return RemoveSubunitFromUnit(subunit=None,url=url_instance)
				except Unit.DoesNotExist:
					return RemoveSubunitFromUnit(subunit=None,url=url_instance)
			except SubUnit.DoesNotExist:
				return RemoveSubunitFromUnit(subunit=None,url=url_instance)
		return RemoveSubunitFromUnit(subunit=None,url=url_instance)

class AddLearningBlockToSubunit(graphene.Mutation):
	class Arguments:
		learning_block_data = LearningBlockInput(required=True)
		
	learning_block = graphene.Field(LearningBlockType)
	url = graphene.Field(UrlRedirectType)
		
	@staticmethod
	def mutate(root, info, learning_block_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				subunit_instance = SubUnit.objects.get(pk=learning_block_data.subunit_id)
				try:
					unit_instance = Unit.objects.get(pk=subunit_instance.unit_id.id)
					try:
						course_instance = Course.objects.get(pk=unit_instance.course_id.id)
						url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
						if (course_instance.creator_id.id == info.context.user.id):
							learning_block_instance = LearningBlock(
								subunit_id = subunit_instance,
								semantic_name = learning_block_data.semantic_name,
								semantic_description = learning_block_data.semantic_description
							)
							learning_block_instance.save()
							return AddLearningBlockToSubunit(learning_block=learning_block_instance, url=url_instance)
					except Course.DoesNotExist:
						return AddLearningBlockToSubunit(learning_block=None, url=url_instance)
				except Unit.DoesNotExist:
					return AddLearningBlockToSubunit(learning_block=None, url=url_instance)
			except SubUnit.DoesNotExist:
				return AddLearningBlockToSubunit(learning_block=None, url=url_instance)
		return AddLearningBlockToSubunit(learning_block=None, url=url_instance)

class RemoveLearningBlockFromSubunit(graphene.Mutation):
	class Arguments:
		learning_block_data = LearningBlockInput(required=True)
		
	learning_block = graphene.Field(LearningBlockType)
	url = graphene.Field(UrlRedirectType)
		
	@staticmethod
	def mutate(root, info, learning_block_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				learning_block_instance = LearningBlock.objects.get(pk=learning_block_data.id)
				try:
					subunit_instance = SubUnit.objects.get(pk=learning_block_data.subunit_id.id)
					try:
						unit_instance = Unit.objects.get(pk=subunit_instance.unit_id).id
						try:
							course_instance = Course.objects.get(pk=unit_instance.course_id.id)
							url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
							if (course_instance.creator_id.id == info.context.user.id):
								learning_block_instance.delete()
								return RemoveLearningBlockFromSubunit(learning_block=None, url=url_instance)
						except Course.DoesNotExist:
							return RemoveLearningBlockFromSubunit(learning_block=None, url=url_instance)
					except Unit.DoesNotExist:
						return RemoveLearningBlockFromSubunit(learning_block=None, url=url_instance)
				except SubUnit.DoesNotExist:
					return RemoveLearningBlockFromSubunit(learning_block=None, url=url_instance)
			except LearningBlock.DoesNotExist:
				return RemoveLearningBlockFromSubunit(learning_block=None, url=url_instance)
		return RemoveLearningBlockFromSubunit(learning_block=None, url=url_instance)

class AddTestToSubunit(graphene.Mutation):
	class Arguments:
		test_data = TestInput(required=True)
		
	test = graphene.Field(TestType)
	url = graphene.Field(UrlRedirectType)
		
	@staticmethod
	def mutate(root, info, test_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				subunit_instance = SubUnit.objects.get(pk=test_data.subunit_id)
				try:
					unit_instance = Unit.objects.get(pk=subunit_instance.unit_id.id)
					try:
						course_instance = Course.objects.get(pk=unit_instance.course_id.id)
						url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
						if (course_instance.creator_id.id == info.context.user.id):
							test_instance = Test(
								subunit_id = subunit_instance,
								test_type = test_data.test_type,
								question_amount = test_data.question_amount
							)
							test_instance.save()
							return AddTestToSubunit(test=test_instance, url=url_instance)
					except Course.DoesNotExist:
						return AddTestToSubunit(test=None, url=url_instance)
				except Unit.DoesNotExist:
					return AddTestToSubunit(test=None, url=url_instance)
			except SubUnit.DoesNotExist:
				return AddTestToSubunit(test=None, url=url_instance)
		return AddTestToSubunit(test=None, url=url_instance)

class RemoveTestFromSubunit(graphene.Mutation):
	class Arguments:
		test_data = TestInput(required=True)
		
	test = graphene.Field(TestType)
	url = graphene.Field(UrlRedirectType)
		
	@staticmethod
	def mutate(root, info, test_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				test_instance = Test.objects.get(pk=test_data.id)
				try:
					subunit_instance = SubUnit.objects.get(pk=test_instance.subunit_id.id)
					try:
						unit_instance = Unit.objects.get(pk=subunit_instance.unit_id.id)
						try:
							course_instance = Course.objects.get(pk=unit_instance.course_id.id)
							url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
							if (course_instance.creator_id.id == info.context.user.id):
								test_instance.delete()
								return RemoveTestFromSubunit(test=None, url=url_instance)
						except Course.DoesNotExist:
							return RemoveTestFromSubunit(test=None, url=url_instance)
					except Unit.DoesNotExist:
						return RemoveTestFromSubunit(test=None, url=url_instance)
				except SubUnit.DoesNotExist:
					return RemoveTestFromSubunit(test=None, url=url_instance)
			except Test.DoesNotExist:
				return RemoveTestFromSubunit(test=None, url=url_instance)
		return RemoveTestFromSubunit(test=None, url=url_instance)
		
class AddQuestionToTest(graphene.Mutation):
	class Arguments:
		question_data = QuestionInput(required=True)
		
	question = graphene.Field(QuestionType)
		
	@staticmethod
	def mutate(root, info, question_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				test_instance = Test.objects.get(pk=question_data.test_id)
				try:
					subunit_instance = SubUnit.objects.get(pk=test_instance.subunit_id.id)
					try:
						unit_instance = Unit.objects.get(pk=subunit_instance.unit_id.id)
						try:
							course_instance = Course.objects.get(pk=unit_instance.course_id.id)
							url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
							if (course_instance.creator_id.id == info.context.user.id):
								question_instance = Question(
									test_id = test_instance,
									question_type = question_data.question_type,
									description = question_data.description,
									duration = question_data.duration
								)
								question_instance.save()
								return AddQuestionToTest(question=question_instance, url=url_instance)
						except Course.DoesNotExist:
							return AddQuestionToTest(question=None, url=url_instance)
					except Unit.DoesNotExist:
						return AddQuestionToTest(question=None, url=url_instance)
				except SubUnit.DoesNotExist:
					return AddQuestionToTest(question=None, url=url_instance)
			except Test.DoesNotExist:
				return AddQuestionToTest(question=None, url=url_instance)
		return AddQuestionToTest(question=None, url=url_instance)
		
class RemoveQuestionFromTest(graphene.Mutation):
	class Arguments:
		question_data = QuestionInput(required=True)
		
	question = graphene.Field(QuestionType)
		
	@staticmethod
	def mutate(root, info, question_data=None):
		url_instance = UrlRedirect(next_url='127.0.0.1:8000/home')
		if (info.context.user.is_authenticated):
			try:
				try:
					test_instance = Test.objects.get(pk=test_data.id)
					try:
						subunit_instance = SubUnit.objects.get(pk=learning_block_data.subunit_id.id)
						try:
							unit_instance = Unit.objects.get(pk=subunit_instance.unit_id.id)
							try:
								course_instance = Course.objects.get(pk=unit_instance.course_id.id)
								url_instance = UrlRedirect(next_url='127.0.0.1:8000/course?id={}'.format(course_instance.id))
								if (course_instance.creator_id.id == info.context.user.id):
									question_instance.delete()
									return RemoveQuestiomFromTest(question=None, url=url_instance)
							except Course.DoesNotExist:
								return RemoveQuestiomFromTest(question=None, url=url_instance)
						except Unit.DoesNotExist:
							return RemoveQuestiomFromTest(question=None, url=url_instance)
					except SubUnit.DoesNotExist:
						return RemoveQuestiomFromTest(question=None, url=url_instance)
				except Test.DoesNotExist:
					return RemoveQuestiomFromTest(question=None, url=url_instance)
			except Question.DoesNotExist:
				return RemoveQuestiomFromTest(question=None, url=url_instance)
		return RemoveQuestiomFromTest(question=None, url=url_instance)

class Mutation(graphene.ObjectType):
	register_user = RegisterUser.Field()
	login_user = LoginUser.Field()
	logout_user = LogoutUser.Field()
	change_user_password = ChangePassword.Field()
	forgot_password = ForgotPassword.Field()

	create_course = CreateCourse.Field()
	update_course = UpdateCourse.Field()
	delete_course = DeleteCourse.Field()
	
	favorite_course = FavoritingCourse.Field()
	unfavorite_course = UnfavoritingCourse.Field()
	
	watch_course = WatchingCourse.Field()
	unwatch_course = UnwatchingCourse.Field()
	
	enroll_course = EnrollInCourse.Field()
	unenroll_course = WithdrawFromCourse.Field()
	
	add_unit_to_course = AddUnitToCourse.Field()
	remove_unit_from_course = RemoveUnitFromCourse.Field()
	
	add_subunit_to_unit = AddSubunitToUnit.Field()
	remove_subunit_from_unit = RemoveSubunitFromUnit.Field()
	
	add_learning_block_to_subunit = AddLearningBlockToSubunit.Field()
	remove_learning_block_from_subunit = RemoveLearningBlockFromSubunit.Field()
	
	add_test_to_subunit = AddTestToSubunit.Field()
	remove_test_from_subunit = RemoveTestFromSubunit.Field()
	
	add_question_to_test = AddQuestionToTest.Field()
	remove_question_from_test = RemoveQuestionFromTest.Field()
