---
subtitle: Own aircraft
title: XPlane datarefs used with swift
---

``` {.}
StringDataRef<xplane::data::sim::aircraft::view::acf_livery_path> m_liveryPath;
StringDataRef<xplane::data::sim::aircraft::view::acf_ICAO> m_icao;
StringDataRef<xplane::data::sim::aircraft::view::acf_descrip> m_descrip;
DataRef<xplane::data::sim::time::paused> m_paused;
DataRef<xplane::data::sim::time::use_system_time> m_useSystemTime;
DataRef<xplane::data::sim::flightmodel::position::latitude> m_latitude;
DataRef<xplane::data::sim::flightmodel::position::longitude> m_longitude;
DataRef<xplane::data::sim::flightmodel::position::elevation> m_elevation;
DataRef<xplane::data::sim::flightmodel::position::y_agl> m_agl;
DataRef<xplane::data::sim::flightmodel::position::groundspeed> m_groundSpeed;
DataRef<xplane::data::sim::flightmodel::position::indicated_airspeed2> m_indicatedAirspeed;
DataRef<xplane::data::sim::flightmodel::position::true_airspeed> m_trueAirspeed;
DataRef<xplane::data::sim::flightmodel::position::theta> m_pitch;
DataRef<xplane::data::sim::flightmodel::position::phi> m_roll;
DataRef<xplane::data::sim::flightmodel::position::psi> m_heading;
DataRef<xplane::data::sim::flightmodel::failures::onground_any> m_onGroundAny;
DataRef<xplane::data::sim::flightmodel::failures::onground_all> m_onGroundAll;
DataRef<xplane::data::sim::cockpit2::radios::actuators::com1_frequency_hz_833> m_com1Active;
DataRef<xplane::data::sim::cockpit2::radios::actuators::com1_standby_frequency_hz_833> m_com1Standby;
DataRef<xplane::data::sim::cockpit2::radios::actuators::audio_com_selection> m_comAudioSelection; // 6==COM1, 7==COM2
DataRef<xplane::data::sim::cockpit2::radios::actuators::com1_power> m_com1Power;
DataRef<xplane::data::sim::cockpit2::radios::actuators::audio_volume_com1> m_com1Volume; // 0..1
DataRef<xplane::data::sim::cockpit2::radios::actuators::audio_selection_com1> m_com1Listening;
DataRef<xplane::data::sim::cockpit2::radios::actuators::com2_frequency_hz_833> m_com2Active;
DataRef<xplane::data::sim::cockpit2::radios::actuators::com2_standby_frequency_hz_833> m_com2Standby;
DataRef<xplane::data::sim::cockpit2::radios::actuators::com2_power> m_com2Power;
DataRef<xplane::data::sim::cockpit2::radios::actuators::audio_volume_com2> m_com2Volume; // 0..1
DataRef<xplane::data::sim::cockpit2::radios::actuators::audio_selection_com2> m_com2Listening;
DataRef<xplane::data::sim::cockpit::radios::transponder_code> m_xpdrCode;
DataRef<xplane::data::sim::cockpit::radios::transponder_mode> m_xpdrMode;
DataRef<xplane::data::sim::cockpit::radios::transponder_id> m_xpdrIdent;
DataRef<xplane::data::sim::cockpit::electrical::beacon_lights_on> m_beaconLightsOn;
DataRef<xplane::data::sim::cockpit::electrical::landing_lights_on> m_landingLightsOn;
DataRef<xplane::data::sim::cockpit::electrical::nav_lights_on> m_navLightsOn;
DataRef<xplane::data::sim::cockpit::electrical::strobe_lights_on> m_strobeLightsOn;
DataRef<xplane::data::sim::cockpit::electrical::taxi_light_on> m_taxiLightsOn;
DataRef<xplane::data::sim::flightmodel2::controls::flap_handle_deploy_ratio> m_flapsReployRatio;
ArrayDataRef<xplane::data::sim::flightmodel2::gear::deploy_ratio> m_gearReployRatio;
DataRef<xplane::data::sim::aircraft::engine::acf_num_engines> m_numberOfEngines;
ArrayDataRef<xplane::data::sim::flightmodel::engine::ENGN_N1_> m_enginesN1Percentage;
DataRef<xplane::data::sim::flightmodel2::controls::speedbrake_ratio> m_speedBrakeRatio;
DataRef<xplane::data::sim::weather::barometer_sealevel_inhg> m_qnhInhg;
```
