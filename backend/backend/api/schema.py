import graphene

from backend.api.query import Query
from backend.api.mutation import Mutation
			
schema = graphene.Schema(query=Query, mutation=Mutation)
