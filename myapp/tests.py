from django.test import TestCase
from .models import Location
from django.contrib.gis.geos import Point


class LocationTestCase(TestCase):
    def setUp(self):
        Location.objects.create(name="Test Location", geom=Point(1, 1))

    def test_location_created(self):
        """Locations are correctly identified"""
        test_location = Location.objects.get(name="Test Location")
        self.assertEqual(test_location.geom.x, 1)
