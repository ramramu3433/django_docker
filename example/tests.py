from django.test import TestCase

from example.models import example
# Create your tests here.
class exampletest(TestCase):
      def createexample(self,fname="janakiraman",fphone="9176724389"):
          return example.objects.create(name=fname,phone=fphone)
      def test_example(self):
          r2=self.createexample()
          self.assertTrue(isinstance(r2,example))
          
	  
          
         
