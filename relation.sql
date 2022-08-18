--
-- Name: airport airport_pkey; Type:  CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE only public.airport
     ADD  CONSTRAINT airport_pkey PRIMARY KEY (iata_code);
-- 
-- 
-- --
-- -- Name: borders border_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.borders
     ADD  CONSTRAINT border_pk PRIMARY KEY (country1, country2);
-- 
-- 
-- --
-- -- Name: city_local_name city_local_name_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.city_local_name
     ADD  CONSTRAINT city_local_name_pk PRIMARY KEY (country, province, city);
-- 
-- 
-- --
-- -- Name: city_other_name city_other_name_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.city_other_name
     ADD  CONSTRAINT city_other_name_pk PRIMARY KEY (country, province, city, other_name);
-- 
-- 
-- --
-- -- Name: city city_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.city
     ADD  CONSTRAINT city_pk PRIMARY KEY (name, province, country);
-- 
-- 
-- --
-- -- Name: city_population city_population_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.city_population
     ADD  CONSTRAINT city_population_pk PRIMARY KEY (country, province, city, year);
-- 
-- 
-- --
-- -- Name: continent continent_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.continent
     ADD  CONSTRAINT continent_pk PRIMARY KEY (name);
-- 
-- 
-- --
-- -- Name: country_local_name country_local_name_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country_local_name
     ADD  CONSTRAINT country_local_name_pk PRIMARY KEY (country);
-- 
-- 
-- --
-- -- Name: country country_name_ck; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country
     ADD  CONSTRAINT country_name_ck UNIQUE (name);
-- 
-- 
-- --
-- -- Name: country_other_name country_other_name_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country_other_name
     ADD  CONSTRAINT country_other_name_pk PRIMARY KEY (country, other_name);
-- 
-- 
-- --
-- -- Name: country country_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country
     ADD  CONSTRAINT country_pk PRIMARY KEY (code);
-- 
-- 
-- --
-- -- Name: country_population country_population_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country_population
     ADD  CONSTRAINT country_population_pk PRIMARY KEY (country, year);
-- 
-- 
-- --
-- -- Name: desert desert_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.desert
     ADD  CONSTRAINT desert_pk PRIMARY KEY (name);
-- 
-- 
-- --
-- -- Name: economy economy_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.economy
     ADD  CONSTRAINT economy_pk PRIMARY KEY (country);
-- 
-- 
-- --
-- -- Name: encompasses encompasses_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.encompasses
     ADD  CONSTRAINT encompasses_pk PRIMARY KEY (country, continent);
-- 
-- 
-- --
-- -- Name: ethnic_group ethnic_group_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.ethnic_group
     ADD  CONSTRAINT ethnic_group_pk PRIMARY KEY (name, country);
-- 
-- 
-- --
-- -- Name: geo_desert geo_desert_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_desert
     ADD  CONSTRAINT geo_desert_pk PRIMARY KEY (province, country, desert);
-- 
-- 
-- --
-- -- Name: geo_estuary geo_estuary_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_estuary
     ADD  CONSTRAINT geo_estuary_pk PRIMARY KEY (province, country, river);
-- 
-- 
-- --
-- -- Name: geo_island geo_island_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_island
     ADD  CONSTRAINT geo_island_pk PRIMARY KEY (province, country, island);
-- 
-- 
-- --
-- -- Name: geo_lake geo_lake_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_lake
     ADD  CONSTRAINT geo_lake_pk PRIMARY KEY (province, country, lake);
-- 
-- 
-- --
-- -- Name: geo_mountain geo_mountain_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_mountain
     ADD  CONSTRAINT geo_mountain_pk PRIMARY KEY (province, country, mountain);
-- 
-- 
-- --
-- -- Name: geo_river geo_river_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_river
     ADD  CONSTRAINT geo_river_pk PRIMARY KEY (province, country, river);
-- 
-- 
-- --
-- -- Name: geo_sea geo_sea_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_sea
     ADD  CONSTRAINT geo_sea_pk PRIMARY KEY (province, country, sea);
-- 
-- 
-- --
-- -- Name: geo_source geo_source_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_source
     ADD  CONSTRAINT geo_source_pk PRIMARY KEY (province, country, river);
-- 
-- 
-- --
-- -- Name: is_member is_member_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.is_member
     ADD  CONSTRAINT is_member_pk PRIMARY KEY (country, organization);
-- 
-- 
-- --
-- -- Name: island island_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.island
     ADD  CONSTRAINT island_pk PRIMARY KEY (name);
-- 
-- 
-- --
-- -- Name: lake_on_island lake_on_island_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.lake_on_island
     ADD  CONSTRAINT lake_on_island_pk PRIMARY KEY (lake);
-- 
-- 
-- --
-- -- Name: lake lake_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.lake
     ADD  CONSTRAINT lake_pk PRIMARY KEY (name);
-- 
-- 
-- --
-- -- Name: language language_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.language
     ADD  CONSTRAINT language_pk PRIMARY KEY (name, country);
-- 
-- 
-- --
-- -- Name: located_on located_on_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.located_on
     ADD  CONSTRAINT located_on_pk PRIMARY KEY (city, province, country, island);
-- 
-- 
-- --
-- -- Name: merges_with merges_with_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.merges_with
     ADD  CONSTRAINT merges_with_pk PRIMARY KEY (sea1, sea2);
-- 
-- 
-- --
-- -- Name: mountain_on_island mountain_on_island_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.mountain_on_island
     ADD  CONSTRAINT mountain_on_island_pk PRIMARY KEY (mountain);
-- 
-- 
-- --
-- -- Name: mountain mountain_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.mountain
     ADD  CONSTRAINT mountain_pk PRIMARY KEY (name);
-- 
-- 
-- --
-- -- Name: organization organization_name_ck; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.organization
     ADD  CONSTRAINT organization_name_ck UNIQUE (name);
-- 
-- 
-- --
-- -- Name: organization organization_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.organization
     ADD  CONSTRAINT organization_pk PRIMARY KEY (abbreviation);
-- 
-- 
-- --
-- -- Name: politics politics_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.politics
     ADD  CONSTRAINT politics_pk PRIMARY KEY (country);
-- 
-- 
-- --
-- -- Name: population population_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.population
     ADD  CONSTRAINT population_pk PRIMARY KEY (country);
-- 
-- 
-- --
-- -- Name: province_local_name province_local_name_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.province_local_name
     ADD  CONSTRAINT province_local_name_pk PRIMARY KEY (country, province);
-- 
-- 
-- --
-- -- Name: province_other_name province_other_name_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.province_other_name
     ADD  CONSTRAINT province_other_name_pk PRIMARY KEY (country, province, other_name);
-- 
-- 
-- --
-- -- Name: province province_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.province
     ADD  CONSTRAINT province_pk PRIMARY KEY (name, country);
-- 
-- 
-- --
-- -- Name: province_population province_population_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.province_population
     ADD  CONSTRAINT province_population_pk PRIMARY KEY (country, province, year);
-- 
-- 
-- --
-- -- Name: religion religion_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.religion
     ADD  CONSTRAINT religion_pk PRIMARY KEY (name, country);
-- 
-- 
-- --
-- -- Name: river_on_island river_on_island_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.river_on_island
     ADD  CONSTRAINT river_on_island_pk PRIMARY KEY (river);
-- 
-- 
-- --
-- -- Name: river river_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.river
     ADD  CONSTRAINT river_pk PRIMARY KEY (name);
-- 
-- 
-- --
-- -- Name: river_through river_through_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.river_through
     ADD  CONSTRAINT river_through_pk PRIMARY KEY (river, lake);
-- 
-- 
-- --
-- -- Name: sea sea_pk; Type:  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.sea
     ADD  CONSTRAINT sea_pk PRIMARY KEY (name);
-- 
-- 
-- --
-- -- Name: airport airport_city_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.airport
     ADD  CONSTRAINT airport_city_fk FOREIGN KEY (city, province, country) REFERENCES public.city(name, province, country);
-- 
-- 
-- --
-- -- Name: borders border_country_a_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.borders
     ADD  CONSTRAINT border_country_a_fk FOREIGN KEY (country1) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: borders border_country_b_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.borders
     ADD  CONSTRAINT border_country_b_fk FOREIGN KEY (country2) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: organization city_local_name_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.organization
     ADD  CONSTRAINT city_local_name_fk FOREIGN KEY (city, province, country) REFERENCES public.city(name, province, country);
-- 
-- 
-- --
-- -- Name: city_local_name city_local_name_isa; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.city_local_name
     ADD  CONSTRAINT city_local_name_isa FOREIGN KEY (city, province, country) REFERENCES public.city(name, province, country);
-- 
-- 
-- --
-- -- Name: city_other_name city_other_name_we; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.city_other_name
     ADD  CONSTRAINT city_other_name_we FOREIGN KEY (city, province, country) REFERENCES public.city(name, province, country);
-- 
-- 
-- --
-- -- Name: city_population city_population_we; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.city_population
     ADD  CONSTRAINT city_population_we FOREIGN KEY (city, province, country) REFERENCES public.city(name, province, country);
-- 
-- 
-- --
-- -- Name: city city_province_we; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.city
     ADD  CONSTRAINT city_province_we FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: country country_capital_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country
     ADD  CONSTRAINT country_capital_fk FOREIGN KEY (capital, province, code) REFERENCES public.city(name, province, country);
-- 
-- 
-- --
-- -- Name: country_local_name country_local_name_country_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country_local_name
     ADD  CONSTRAINT country_local_name_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: country_local_name country_local_name_isa; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country_local_name
     ADD  CONSTRAINT country_local_name_isa FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: country_other_name country_other_name_country_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country_other_name
     ADD  CONSTRAINT country_other_name_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: country_other_name country_other_name_we; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country_other_name
     ADD  CONSTRAINT country_other_name_we FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: country_population country_population_country_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.country_population
     ADD  CONSTRAINT country_population_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: economy economy_country_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.economy
     ADD  CONSTRAINT economy_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: economy economy_isa; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.economy
     ADD  CONSTRAINT economy_isa FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: encompasses encompasses_continent_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.encompasses
     ADD  CONSTRAINT encompasses_continent_fk FOREIGN KEY (continent) REFERENCES public.continent(name);
-- 
-- 
-- --
-- -- Name: encompasses encompasses_country_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.encompasses
     ADD  CONSTRAINT encompasses_country_fk FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: ethnic_group ethnic_group_country_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.ethnic_group
     ADD  CONSTRAINT ethnic_group_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: ethnic_group ethnic_group_we; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.ethnic_group
     ADD  CONSTRAINT ethnic_group_we FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: geo_desert geo_desert_desert_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_desert
     ADD  CONSTRAINT geo_desert_desert_fk FOREIGN KEY (desert) REFERENCES public.desert(name);
-- 
-- 
-- --
-- -- Name: geo_desert geo_desert_province_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_desert
     ADD  CONSTRAINT geo_desert_province_fk FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: geo_estuary geo_estuary_province_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_estuary
     ADD  CONSTRAINT geo_estuary_province_fk FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: geo_estuary geo_estuary_river_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_estuary
     ADD  CONSTRAINT geo_estuary_river_fk FOREIGN KEY (river) REFERENCES public.river(name);
-- 
-- 
-- --
-- -- Name: geo_island geo_island_country_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_island
     ADD  CONSTRAINT geo_island_country_fk FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: geo_island geo_island_island_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_island
     ADD  CONSTRAINT geo_island_island_fk FOREIGN KEY (island) REFERENCES public.island(name);
-- 
-- 
-- --
-- -- Name: geo_island geo_island_province_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_island
     ADD  CONSTRAINT geo_island_province_fk FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: geo_river geo_island_province_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_river
     ADD  CONSTRAINT geo_island_province_fk FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: geo_lake geo_lake_lake_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_lake
     ADD  CONSTRAINT geo_lake_lake_fk FOREIGN KEY (lake) REFERENCES public.lake(name);
-- 
-- 
-- --
-- -- Name: geo_lake geo_lake_province_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_lake
     ADD  CONSTRAINT geo_lake_province_fk FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: geo_mountain geo_mountain_mountain_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_mountain
     ADD  CONSTRAINT geo_mountain_mountain_fk FOREIGN KEY (mountain) REFERENCES public.mountain(name);
-- 
-- 
-- --
-- -- Name: geo_mountain geo_mountain_province_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_mountain
     ADD  CONSTRAINT geo_mountain_province_fk FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: geo_river geo_river_country_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_river
     ADD  CONSTRAINT geo_river_country_fk FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: geo_river geo_river_river_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_river
     ADD  CONSTRAINT geo_river_river_fk FOREIGN KEY (river) REFERENCES public.river(name);
-- 
-- 
-- --
-- -- Name: geo_sea geo_sea_province_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_sea
     ADD  CONSTRAINT geo_sea_province_fk FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: geo_sea geo_sea_sea_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_sea
     ADD  CONSTRAINT geo_sea_sea_fk FOREIGN KEY (sea) REFERENCES public.sea(name);
-- 
-- 
-- --
-- -- Name: geo_source geo_source_province_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_source
     ADD  CONSTRAINT geo_source_province_fk FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: geo_source geo_source_river_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.geo_source
     ADD  CONSTRAINT geo_source_river_fk FOREIGN KEY (river) REFERENCES public.river(name);
-- 
-- 
-- --
-- -- Name: is_member is_member_country_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.is_member
     ADD  CONSTRAINT is_member_country_fk FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: is_member is_member_organization_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.is_member
     ADD  CONSTRAINT is_member_organization_fk FOREIGN KEY (organization) REFERENCES public.organization(abbreviation);
-- 
-- 
-- --
-- -- Name: lake_on_island lake_on_island_island_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.lake_on_island
     ADD  CONSTRAINT lake_on_island_island_fk FOREIGN KEY (island) REFERENCES public.island(name);
-- 
-- 
-- --
-- -- Name: lake_on_island lake_on_island_lake_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.lake_on_island
     ADD  CONSTRAINT lake_on_island_lake_fk FOREIGN KEY (lake) REFERENCES public.lake(name);
-- 
-- 
-- --
-- -- Name: lake lake_river_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.lake
     ADD  CONSTRAINT lake_river_fk FOREIGN KEY (river) REFERENCES public.river(name);
-- 
-- 
-- --
-- -- Name: language language_country_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.language
     ADD  CONSTRAINT language_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: language language_we; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.language
     ADD  CONSTRAINT language_we FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: located located_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.located
     ADD  CONSTRAINT located_fk FOREIGN KEY (city, province, country) REFERENCES public.city(name, province, country);
-- 
-- 
-- --
-- -- Name: located located_geo_lake; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.located
     ADD  CONSTRAINT located_geo_lake FOREIGN KEY (province, country, lake) REFERENCES public.geo_lake(province, country, lake);
-- 
-- 
-- --
-- -- Name: located located_geo_river; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.located
     ADD  CONSTRAINT located_geo_river FOREIGN KEY (province, country, river) REFERENCES public.geo_river(province, country, river);
-- 
-- 
-- --
-- -- Name: located located_geo_sea; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.located
     ADD  CONSTRAINT located_geo_sea FOREIGN KEY (province, country, sea) REFERENCES public.geo_sea(province, country, sea);
-- 
-- 
-- --
-- -- Name: located located_lake_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.located
     ADD  CONSTRAINT located_lake_fk FOREIGN KEY (lake) REFERENCES public.lake(name);
-- 
-- 
-- --
-- -- Name: located_on located_on_city_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.located_on
     ADD  CONSTRAINT located_on_city_fk FOREIGN KEY (city, province, country) REFERENCES public.city(name, province, country);
-- 
-- 
-- --
-- -- Name: located_on located_on_island_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.located_on
     ADD  CONSTRAINT located_on_island_fk FOREIGN KEY (island) REFERENCES public.island(name);
-- 
-- 
-- --
-- -- Name: located located_river_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.located
     ADD  CONSTRAINT located_river_fk FOREIGN KEY (river) REFERENCES public.river(name);
-- 
-- 
-- --
-- -- Name: located located_sea_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.located
     ADD  CONSTRAINT located_sea_fk FOREIGN KEY (sea) REFERENCES public.sea(name);
-- 
-- 
-- --
-- -- Name: merges_with merges_with_sea_a_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.merges_with
     ADD  CONSTRAINT merges_with_sea_a_fk FOREIGN KEY (sea1) REFERENCES public.sea(name);
-- 
-- 
-- --
-- -- Name: merges_with merges_with_sea_b_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.merges_with
     ADD  CONSTRAINT merges_with_sea_b_fk FOREIGN KEY (sea2) REFERENCES public.sea(name);
-- 
-- 
-- --
-- -- Name: mountain_on_island mountain_on_island_island_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.mountain_on_island
     ADD  CONSTRAINT mountain_on_island_island_fk FOREIGN KEY (island) REFERENCES public.island(name);
-- 
-- 
-- --
-- -- Name: mountain_on_island mountain_on_island_mountain_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.mountain_on_island
     ADD  CONSTRAINT mountain_on_island_mountain_fk FOREIGN KEY (mountain) REFERENCES public.mountain(name);
-- 
-- 
-- --
-- -- Name: politics politics_dependent_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.politics
     ADD  CONSTRAINT politics_dependent_fkey FOREIGN KEY (dependent) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: politics politics_isa; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.politics
     ADD  CONSTRAINT politics_isa FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: population population_country_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.population
     ADD  CONSTRAINT population_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: population population_isa; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.population
     ADD  CONSTRAINT population_isa FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: province province_country_we; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.province
     ADD  CONSTRAINT province_country_we FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: province_local_name province_local_name_isa; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.province_local_name
     ADD  CONSTRAINT province_local_name_isa FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: province_other_name province_other_name_we; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.province_other_name
     ADD  CONSTRAINT province_other_name_we FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: province_population province_population_we; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.province_population
     ADD  CONSTRAINT province_population_we FOREIGN KEY (province, country) REFERENCES public.province(name, country);
-- 
-- 
-- --
-- -- Name: religion religion_country_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.religion
     ADD  CONSTRAINT religion_country_fkey FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: religion religion_we; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.religion
     ADD  CONSTRAINT religion_we FOREIGN KEY (country) REFERENCES public.country(code);
-- 
-- 
-- --
-- -- Name: river river_lake_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.river
     ADD  CONSTRAINT river_lake_fk FOREIGN KEY (lake) REFERENCES public.lake(name);
-- 
-- 
-- --
-- -- Name: river_on_island river_on_island_island_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.river_on_island
     ADD  CONSTRAINT river_on_island_island_fk FOREIGN KEY (island) REFERENCES public.island(name);
-- 
-- 
-- --
-- -- Name: river_on_island river_on_island_river_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.river_on_island
     ADD  CONSTRAINT river_on_island_river_fk FOREIGN KEY (river) REFERENCES public.river(name);
-- 
-- 
-- --
-- -- Name: river river_sea_fk; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.river
     ADD  CONSTRAINT river_sea_fk FOREIGN KEY (sea) REFERENCES public.sea(name);
-- 
-- 
-- --
-- -- Name: river_through river_through_lake_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.river_through
     ADD  CONSTRAINT river_through_lake_fkey FOREIGN KEY (lake) REFERENCES public.lake(name);
-- 
-- 
-- --
-- -- Name: river_through river_through_river_fkey; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.river_through
     ADD  CONSTRAINT river_through_river_fkey FOREIGN KEY (river) REFERENCES public.river(name);
-- 
-- 
-- --
-- -- Name: river tributary_to; Type: FK  CONSTRAINT; Schema: public; Owner: -
-- --
-- 
ALTER TABLE only public.river
     ADD  CONSTRAINT tributary_to FOREIGN KEY (river) REFERENCES public.river(name);