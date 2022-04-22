import graphene
from graphene_django import DjangoObjectType

from database.models import *
from django.contrib.auth import get_user_model
		
class UserType(DjangoObjectType):
	class Meta:
		model = get_user_model()
		fields = "__all__"	
	
class UrlRedirectType(DjangoObjectType):
	class Meta:
		model = UrlRedirect
		fields = "__all__"

class CourseType(DjangoObjectType):
	class Meta:
		model = Course
		fields = "__all__"
		
class FavoriteCourseType(DjangoObjectType):
	class Meta:
		model = FavoriteCourse
		fields = "__all__"
		
class EnrolledCourseType(DjangoObjectType):
	class Meta:
		model = EnrolledCourse
		fields = "__all__"
		
class WatchCourseType(DjangoObjectType):
	class Meta:
		model = WatchCourse
		fields = "__all__"
		
class UnitType(DjangoObjectType):
	class Meta:
		model = Unit
		fields = "__all__"
		
class SubUnitType(DjangoObjectType):
	class Meta:
		model = SubUnit
		fields = "__all__"
		
class LearningBlockType(DjangoObjectType):
	class Meta:
		model = LearningBlock
		fields = "__all__"
		
class LearningBlockProgressType(DjangoObjectType):
	class Meta:
		model = LearningBlockProgress
		fields = "__all__"
		
class TestType(DjangoObjectType):
	class Meta:
		model = Test
		fields = "__all__"
		
class QuestionType(DjangoObjectType):
	class Meta:
		model = Question
		fields = "__all__"
		
class QuestionChoiceType(DjangoObjectType):
	class Meta:
		model = QuestionChoice
		fields = "__all__"
		
class QuestionAnswerType(DjangoObjectType):
	class Meta:
		model = QuestionAnswer
		fields = "__all__"
		
class ModificationType(DjangoObjectType):
	class Meta:
		model = Modification
		fields = "__all__"
