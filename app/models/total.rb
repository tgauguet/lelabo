#!/usr/env/bin ruby
#encoding: utf-8

class Total < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :assembly
  validate :limit_totals, on: :create

  def limit_totals
		if self.recipe && self.recipe.totals(:reload).size > 5
			fail "Limité à 5 par recette"
    elsif self.assembly && self.assembly.totals(:reload).size > 5
  		fail "Limité à 5 par recette"
		end
	end
end
