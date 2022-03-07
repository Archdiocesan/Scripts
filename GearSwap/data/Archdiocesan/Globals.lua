state.AutoEngageMode = M(false, 'Auto Engage Mode')

windower.register_event('zone change', function(id)
			if world.area == 'Nashmau' 
						then windower.send_command('config FrameRateDivisor 2; config ClippingPlane 0.5; showfps; wait 10; showfps')
						
			elseif world.area == 'Western Adoulin'
				or world.area == 'Eastern Adoulin' 
				or world.area == 'North Gustaberg [S]' 
				or world.area == "Dynamis - San d'Oria [D]" 
				or world.area == 'Dynamis - Bastok [D]' 
				or world.area == 'Dynamis - Windurst [D]' 
				or world.area == 'Dynamis - Jeuno [D]' 
				or world.area == 'Mhaura'
				or world.area == 'Rabao'
				or world.area == 'Walk of Echoes [P1]'
				or world.area == 'Mog Garden'						
						then windower.send_command('config FrameRateDivisor 2; config ClippingPlane 0.3; showfps; wait 10; showfps')
						
			elseif world.area == 'Aht Urhgan Whitegate' 
						then windower.send_command('config FrameRateDivisor 2; config ClippingPlane 0.1; showfps; wait 10; showfps')	
						
			elseif world.area == 'Port Jeuno'
						then windower.send_command('config FrameRateDivisor 1; config ClippingPlane 0.3; showfps; wait 10; showfps')
					
						else windower.send_command('config FrameRateDivisor 1; config ClippingPlane 1; showfps; wait 10; showfps')
			end
				
			if world.area == 'Reisenjima Henge' 
					then windower.send_command('lua l Omen')
			end
			if world.area == 'Nyzul Isle'
					then windower.send_command('lua l NyzulHelper')
			end
			if world.area == 'Hazhalm Testing Grounds' 
					then windower.send_command('lua l Valkyrie')
			end
end)
	

latency = .75

--If this is set to true it will prevent you from casting shadows when you have more up than that spell would generate.
conserveshadows = false

