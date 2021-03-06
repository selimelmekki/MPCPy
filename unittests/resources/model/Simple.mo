within ;
package Simple "A package containing simple examples"
  model RC "A simple RC network for example purposes"
    parameter Modelica.SIunits.Temperature To = 295 "Starting temperature";
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
      prescribedTemperature
      annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
      annotation (Placement(transformation(extent={{70,0},{90,20}})));
    Modelica.Blocks.Sources.Sine Tamb(
      amplitude=10,
      offset=278.15,
      freqHz=1/(24*3600))
      annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
      annotation (Placement(transformation(extent={{-18,-40},{2,-20}})));
    Modelica.Blocks.Interfaces.RealOutput T_db
      "Absolute temperature as output signal"
      annotation (Placement(transformation(extent={{100,0},{120,20}})));
    Modelica.Blocks.Interfaces.RealInput q_flow(unit="W")
      annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C=1e5, T(start=
            To, fixed=true))
      annotation (Placement(transformation(extent={{20,10},{40,30}})));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R=
          0.01) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  equation
    connect(temperatureSensor.T,T_db)
      annotation (Line(points={{90,10},{110,10}},       color={0,0,127}));
    connect(Tamb.y,prescribedTemperature. T)
      annotation (Line(points={{-59,10},{-42,10}},
                                                 color={0,0,127}));
    connect(prescribedHeatFlow.Q_flow,q_flow)
      annotation (Line(points={{-18,-30},{-120,-30}}, color={0,0,127}));
    connect(heatCapacitor.port, temperatureSensor.port)
      annotation (Line(points={{30,10},{50,10},{70,10}}, color={191,0,0}));
    connect(heatCapacitor.port, prescribedHeatFlow.port)
      annotation (Line(points={{30,10},{30,-30},{2,-30}}, color={191,0,0}));
    connect(prescribedTemperature.port, thermalResistor.port_a)
      annotation (Line(points={{-20,10},{-16,10},{-10,10}}, color={191,0,0}));
    connect(thermalResistor.port_b, heatCapacitor.port)
      annotation (Line(points={{10,10},{20,10},{30,10}}, color={191,0,0}));
    annotation ();
  end RC;

  model RC_noinputs "A simple RC network for example purposes with no inputs"
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
      prescribedTemperature
      annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
      annotation (Placement(transformation(extent={{70,0},{90,20}})));
    Modelica.Blocks.Sources.Sine Tamb(
      amplitude=10,
      offset=278.15,
      freqHz=1/(24*3600))
      annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
      annotation (Placement(transformation(extent={{-18,-40},{2,-20}})));
    Modelica.Blocks.Interfaces.RealOutput T_db
      "Absolute temperature as output signal"
      annotation (Placement(transformation(extent={{100,0},{120,20}})));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C=1e5)
      annotation (Placement(transformation(extent={{20,10},{40,30}})));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R=
          0.01) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
    Modelica.Blocks.Sources.Step q_flow(
      height=10,
      offset=0,
      startTime=7200)
      annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  equation
    connect(temperatureSensor.T,T_db)
      annotation (Line(points={{90,10},{110,10}},       color={0,0,127}));
    connect(Tamb.y,prescribedTemperature. T)
      annotation (Line(points={{-59,10},{-42,10}},
                                                 color={0,0,127}));
    connect(heatCapacitor.port, temperatureSensor.port)
      annotation (Line(points={{30,10},{50,10},{70,10}}, color={191,0,0}));
    connect(heatCapacitor.port, prescribedHeatFlow.port)
      annotation (Line(points={{30,10},{30,-30},{2,-30}}, color={191,0,0}));
    connect(prescribedTemperature.port, thermalResistor.port_a)
      annotation (Line(points={{-20,10},{-16,10},{-10,10}}, color={191,0,0}));
    connect(thermalResistor.port_b, heatCapacitor.port)
      annotation (Line(points={{10,10},{20,10},{30,10}}, color={191,0,0}));
    connect(prescribedHeatFlow.Q_flow, q_flow.y)
      annotation (Line(points={{-18,-30},{-59,-30}}, color={0,0,127}));
  end RC_noinputs;

  model RC_nostart "A simple RC network for example purposes with no start values."
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
      prescribedTemperature
      annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
      annotation (Placement(transformation(extent={{70,0},{90,20}})));
    Modelica.Blocks.Sources.Sine Tamb(
      amplitude=10,
      offset=278.15,
      freqHz=1/(24*3600))
      annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
      annotation (Placement(transformation(extent={{-18,-40},{2,-20}})));
    Modelica.Blocks.Interfaces.RealOutput T_db
      "Absolute temperature as output signal"
      annotation (Placement(transformation(extent={{100,0},{120,20}})));
    Modelica.Blocks.Interfaces.RealInput q_flow(unit="W")
      annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C=1e5)
      annotation (Placement(transformation(extent={{20,10},{40,30}})));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R=
          0.01) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  equation
    connect(temperatureSensor.T,T_db)
      annotation (Line(points={{90,10},{110,10}},       color={0,0,127}));
    connect(Tamb.y,prescribedTemperature. T)
      annotation (Line(points={{-59,10},{-42,10}},
                                                 color={0,0,127}));
    connect(prescribedHeatFlow.Q_flow,q_flow)
      annotation (Line(points={{-18,-30},{-120,-30}}, color={0,0,127}));
    connect(heatCapacitor.port, temperatureSensor.port)
      annotation (Line(points={{30,10},{50,10},{70,10}}, color={191,0,0}));
    connect(heatCapacitor.port, prescribedHeatFlow.port)
      annotation (Line(points={{30,10},{30,-30},{2,-30}}, color={191,0,0}));
    connect(prescribedTemperature.port, thermalResistor.port_a)
      annotation (Line(points={{-20,10},{-16,10},{-10,10}}, color={191,0,0}));
    connect(thermalResistor.port_b, heatCapacitor.port)
      annotation (Line(points={{10,10},{20,10},{30,10}}, color={191,0,0}));
    annotation ();
  end RC_nostart;

  model R2C2 "A simple R2C2 network for example purposes"
    parameter Modelica.SIunits.Temperature To = 295 "Starting temperature";
    parameter Modelica.SIunits.Temperature T2o = 288.15 "Starting temperature for 2nd state";
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
      prescribedTemperature
      annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
      annotation (Placement(transformation(extent={{70,0},{90,20}})));
    Modelica.Blocks.Sources.Sine Tamb(
      amplitude=10,
      offset=278.15,
      freqHz=1/(24*3600))
      annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
      annotation (Placement(transformation(extent={{-18,-40},{2,-20}})));
    Modelica.Blocks.Interfaces.RealOutput T_db(unit="K")
      "Absolute temperature as output signal"
      annotation (Placement(transformation(extent={{100,0},{120,20}})));
    Modelica.Blocks.Interfaces.RealInput q_flow(unit="W", start=100)
      annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C=1e5, T(start=
            To, fixed=true))
      annotation (Placement(transformation(extent={{20,10},{40,30}})));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R=0.015)
                annotation (Placement(transformation(extent={{-10,0},{10,20}})));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor2(C=2e6, T(fixed=
            true, start=T2o))
      annotation (Placement(transformation(extent={{20,-80},{40,-100}})));
    Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor1(R=0.015)
                annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={30,-50})));
  equation
    connect(temperatureSensor.T,T_db)
      annotation (Line(points={{90,10},{110,10}},       color={0,0,127}));
    connect(Tamb.y,prescribedTemperature. T)
      annotation (Line(points={{-59,10},{-42,10}},
                                                 color={0,0,127}));
    connect(prescribedHeatFlow.Q_flow,q_flow)
      annotation (Line(points={{-18,-30},{-120,-30}}, color={0,0,127}));
    connect(heatCapacitor.port, temperatureSensor.port)
      annotation (Line(points={{30,10},{50,10},{70,10}}, color={191,0,0}));
    connect(heatCapacitor.port, prescribedHeatFlow.port)
      annotation (Line(points={{30,10},{30,-30},{2,-30}}, color={191,0,0}));
    connect(prescribedTemperature.port, thermalResistor.port_a)
      annotation (Line(points={{-20,10},{-16,10},{-10,10}}, color={191,0,0}));
    connect(thermalResistor.port_b, heatCapacitor.port)
      annotation (Line(points={{10,10},{20,10},{30,10}}, color={191,0,0}));
    connect(heatCapacitor.port, thermalResistor1.port_a)
      annotation (Line(points={{30,10},{30,-40}}, color={191,0,0}));
    connect(thermalResistor1.port_b, heatCapacitor2.port)
      annotation (Line(points={{30,-60},{30,-80}}, color={191,0,0}));
    annotation (experiment(
        StopTime=86400,
        Interval=1800,
        Tolerance=1e-06,
        __Dymola_Algorithm="Cvode"));
  end R2C2;

  package SubPackage
    model RC "A simple RC network for example purposes"
      parameter Modelica.SIunits.Temperature To = 295 "Starting temperature";
      Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
        prescribedTemperature
        annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
      Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
        annotation (Placement(transformation(extent={{70,0},{90,20}})));
      Modelica.Blocks.Sources.Sine Tamb(
        amplitude=10,
        offset=278.15,
        freqHz=1/(24*3600))
        annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
        annotation (Placement(transformation(extent={{-18,-40},{2,-20}})));
      Modelica.Blocks.Interfaces.RealOutput T_db
        "Absolute temperature as output signal"
        annotation (Placement(transformation(extent={{100,0},{120,20}})));
      Modelica.Blocks.Interfaces.RealInput q_flow(unit="W")
        annotation (Placement(transformation(extent={{-140,-50},{-100,-10}})));
      Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C=1e5, T(start=
              To, fixed=true))
        annotation (Placement(transformation(extent={{20,10},{40,30}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R=
            0.01) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
    equation
      connect(temperatureSensor.T,T_db)
        annotation (Line(points={{90,10},{110,10}},       color={0,0,127}));
      connect(Tamb.y,prescribedTemperature. T)
        annotation (Line(points={{-59,10},{-42,10}},
                                                   color={0,0,127}));
      connect(prescribedHeatFlow.Q_flow,q_flow)
        annotation (Line(points={{-18,-30},{-120,-30}}, color={0,0,127}));
      connect(heatCapacitor.port, temperatureSensor.port)
        annotation (Line(points={{30,10},{50,10},{70,10}}, color={191,0,0}));
      connect(heatCapacitor.port, prescribedHeatFlow.port)
        annotation (Line(points={{30,10},{30,-30},{2,-30}}, color={191,0,0}));
      connect(prescribedTemperature.port, thermalResistor.port_a)
        annotation (Line(points={{-20,10},{-16,10},{-10,10}}, color={191,0,0}));
      connect(thermalResistor.port_b, heatCapacitor.port)
        annotation (Line(points={{10,10},{20,10},{30,10}}, color={191,0,0}));
      annotation ();
    end RC;
  end SubPackage;
  annotation (uses(Modelica(version="3.2.2")));
end Simple;
