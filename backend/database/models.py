from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, UserManager

from django.utils import timezone
		

class User(AbstractBaseUser, PermissionsMixin):
	username = models.CharField(max_length=50)
	email = models.EmailField(unique=True)
	date_joined = models.DateTimeField(default=timezone.now, editable=False)
	description = models.TextField()
	
	objects = UserManager()
	
	USERNAME_FIELD = 'email'
	EMAIL_FIELD = 'email'
	REQUIRED_FIELDS = []
	
class UrlRedirect(models.Model):
	next_url = models.TextField()
	
PRIVACY_TYPE = (
	('public', 'public'),
	('private', 'private')
)

class Course(models.Model):
	creator_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='creations')
	privacy_type = models.CharField(choices=PRIVACY_TYPE, max_length=50)
	name = models.TextField()
	description = models.TextField()
	creation_date = models.DateTimeField(default=timezone.now, editable=False)
	last_update = models.DateTimeField(default=timezone.now, editable=True)
	
class FavoriteCourse(models.Model):
	user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='favorited')
	course_id = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='favorites')
	
class EnrolledCourse(models.Model):
	user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='enrolled')
	course_id = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='enrolled')
	
class WatchCourse(models.Model):
	user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='watching')
	course_id = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='watching')
	
class Unit(models.Model):
	course_id = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='units')
	name = models.TextField()
	description = models.TextField()
	
class SubUnit(models.Model):
	unit_id = models.ForeignKey(Unit, on_delete=models.CASCADE, related_name='subunits')
	name = models.TextField()
	description = models.TextField()
	
class LearningBlock(models.Model):
	subunit_id = models.ForeignKey(SubUnit, on_delete=models.CASCADE, related_name='learning_blocks')
	semantic_name = models.TextField()
	semantic_description = models.TextField()
	
class LearningBlockProgress(models.Model):
	user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_progress')
	learning_block_id = models.ForeignKey(LearningBlock, on_delete=models.CASCADE)
	srs_increment = models.IntegerField()
	
TEST_TYPE = (
	('peri', 'peri-unit'),
	('pre', 'pre-unit'),
	('post', 'post-unit')
)
	
class Test(models.Model):
	subunit_id = models.ForeignKey(SubUnit, on_delete=models.CASCADE)
	test_type = models.CharField(choices=TEST_TYPE, max_length=50)
	question_amount = models.IntegerField()
	
QUESTION_TYPE = (
	('single', 'single answer'),
	('multiple', 'multiple choice'),
	('matching', 'matching'),
	('fill', 'fill in the blank'),
	('order', 'put in the correct order'),
	('verify', 'true or false')
)
	
class Question(models.Model):
	test_id = models.ForeignKey(Test, on_delete=models.CASCADE, related_name='questions')
	question_type = models.CharField(choices=QUESTION_TYPE, max_length=50)
	description = models.TextField()
	duration = models.IntegerField()
	
class QuestionChoice(models.Model):
	question_id = models.ForeignKey(Question, on_delete=models.CASCADE)
	choice_description = models.TextField()
	
class QuestionAnswer(models.Model):
	question_id = models.ForeignKey(Question, on_delete=models.CASCADE)
	question_choice_id = models.ForeignKey(QuestionChoice, on_delete=models.CASCADE)
	
MODIFICATION_TYPE = (
	('remove', 'remove'),
	('add', 'add'),
	('change', 'change')
)
	
KNOWLEDGE_TYPE = (
	('course', 'course'),
	('unit', 'unit'),
	('subunit', 'subunit'),
	('block', 'learning block'),
	('test', 'test'),
	('question', 'question')
)
	
class Modification(models.Model):
	modification_type = models.CharField(choices=MODIFICATION_TYPE, max_length=50)
	modification_time = models.TimeField(auto_now=True)
	knowledge_type = models.CharField(choices=KNOWLEDGE_TYPE, max_length=50)
	knowledge_id = models.IntegerField()
