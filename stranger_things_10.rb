use_bpm 60
set_volume! 5

#COMMENT OUT BEFORE PLAYING
##| sample :drum_bass_soft, amp: 1
##| sleep 1.1
##| sample :drum_bass_soft, amp: 1
##| sleep 0.2
##| sample :drum_bass_soft, amp: 1
##| sleep 1.1


##| sample :drum_bass_soft, amp: 2
##| cue :beat1
##| sleep 0.2
##| sample :drum_bass_soft, amp: 1
##| cue :beat2
##| sleep 0.55

live_loop :heartbeat do
  
  with_fx :lpf, cutoff: 90 do
    with_fx :reverb do
      sample :drum_bass_soft, amp: 2
      cue :beat1
      sleep 0.2
      sample :drum_bass_soft, amp: 1
      cue :beat2
      sleep 0.55
      
    end
  end
end


live_loop :melody do
  use_synth [:beep, :blade, :hollow].choose
  sync :beat1
  play_pattern_timed(ring :c4, :e4, :g4, :b4, :c5), 0.18 , amp: rrand_i(1,2)
  cue :arp1
  sync :beat2
  play_pattern_timed(ring :e4, :g4, :b4).reverse, 0.18 , amp: rrand_i(1,2)
  cue :arp2
end



##| 10.times do
##|   use_synth :hollow
##|   play :c2, sustain: 4, amp: 3
##|   sleep 1
##| end



##| 1.times do
##|   use_synth :hollow
##|   sync :arp2
##|   play :g4, sustain: 4, amp: 4
##| end

##| 1.times do
##|   use_synth :hollow
##|   play :c2, sustain: 1, amp: 4
##|   sleep 0.75
##|   play :d2, sustain: 1, amp: 4
##|   sleep 0.75
##|   play :e2, sustain: 3, amp: 4
##|   sleep 3
##|   play :d2, sustain: 1, amp: 4
##|   sleep 1
##|   play :c2, sustain: 1, amp: 4
##| end


##| 1.times do
##|   use_synth :hollow
##|   sync :arp1
##|   play :b2, sustain: 1
##|   sleep 0.5
##|   play :c3, sustain: 2
##|   sleep 1
##|   play :d3, sustain: 1
##|   sleep 0.5
##|   play :c3, sustain: 1
##|   sleep 0.5
##|   play :b2, sustain: 6, amp: 4 #lasts for 3 bars!
##|   sync :arp1
##|   sleep 2
##| end


##| 1.times do
##|   use_synth :hollow
##|   with_fx :ixi_techno, phase: 1, wave: 1, mix: 0.5, cutoff_min: 60, cutoff_max: 80 do
##|     play :b4, sustain: 1
##|     sleep 0.5
##|     play :c5, sustain: 2
##|     sleep 1
##|     play :d5, sustain: 1
##|     sleep 0.5
##|     play :c5, sustain: 1
##|     sleep 0.5
##|     play :b4, sustain: 6, amp: 4,  cutoff_attack: 4, cutoff_release: 4
##|   end
##|   sleep 2
##| end


##| 1.times do
##|   use_synth :hollow
##|   play :b3
##|   play (chord_invert (chord :E2, "m"), 3), sustain: 5,  decay_level: 5
##|   sleep 1
##| end

