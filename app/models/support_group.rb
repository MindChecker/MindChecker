class SupportGroup < ActiveRecord::Base
  EARTH_RADIUS = 6371

  def self.all_near(reference, distance_in_km)
    chosen_ones = []
    SupportGroup.all.each do |support_group|
      if support_group.latitude.class == Float && support_group.longitude.class == Float

        # Angles
        theta_1 = (support_group.latitude) * (Math::PI / 180)
        theta_2 = (reference['lat']) * (Math::PI / 180)
        lambda_1 = (support_group.longitude) * (Math::PI / 180)
        lambda_2 = (reference['lng']) * (Math::PI / 180)

        # Differences
        d_theta = (theta_2 - theta_1)
        d_lambda = (lambda_2 - lambda_1)

        # More stuff
        a = Math.sin(d_theta/2)**2 + Math.cos(theta_1) * Math.cos(theta_2) * Math.sin(d_lambda/2)**2
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

        # Distance
        distance = EARTH_RADIUS * c 
        
        chosen_ones << support_group if distance <= distance_in_km
      end
    end
    chosen_ones
  end
end
