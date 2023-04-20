- dashboard: telco_customer_churn
  title: Telco Customer Churn
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Churn Rate
    name: Churn Rate
    model: ml-accelerator-tutorials
    explore: telco_customer_churn
    type: single_value
    fields: [customer.churn_rate, customer.churn_count, customer.customer_count]
    filters:
      customer.dataframe: train
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
    custom_color: "#3F6173"
    single_value_title: ''
    comparison_label: Customers Cancelled
    conditional_formatting: [{type: greater than, value: 500, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_value_labels: true
    font_size: 11
    hide_legend: true
    series_colors:
      customer.churn_count: "#068993"
      customer.customer_count: grey
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    listen: {}
    row: 0
    col: 0
    width: 4
    height: 4
  - title: Churn Rate 3 times higher for International Plan Users
    name: Churn Rate 3 times higher for International Plan Users
    model: ml-accelerator-tutorials
    explore: telco_customer_churn
    type: looker_bar
    fields: [customer.churn_rate, customer.international_plan]
    fill_fields: [customer.international_plan]
    filters:
      customer.dataframe: train
    sorts: [customer.churn_rate desc, customer.international_plan]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: customer.churn_rate,
            id: customer.churn_rate, name: Churn Rate}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: International Plan
    hide_legend: true
    font_size: 18px
    series_types: {}
    series_colors:
      customer.churn_rate: "#3FB0D5"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Customers Churned
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 0
    col: 4
    width: 7
    height: 4
  - title: Users with Voice Mail Plan are Less Likely to Churn
    name: Users with Voice Mail Plan are Less Likely to Churn
    model: ml-accelerator-tutorials
    explore: telco_customer_churn
    type: looker_bar
    fields: [customer.churn_rate, customer.voice_mail_plan]
    fill_fields: [customer.voice_mail_plan]
    filters:
      customer.dataframe: train
    sorts: [customer.churn_rate desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: customer.churn_rate,
            id: customer.churn_rate, name: Churn Rate}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Voice Mail
    hide_legend: true
    font_size: '18'
    series_types: {}
    series_colors:
      customer.churn_rate: "#3FB0D5"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Customers Churned
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 0
    col: 11
    width: 7
    height: 4
  - title: Churn Increases Significantly after 4 Service Calls
    name: Churn Increases Significantly after 4 Service Calls
    model: ml-accelerator-tutorials
    explore: telco_customer_churn
    type: looker_bar
    fields: [customer.churn_rate, customer.service_calls_group]
    filters:
      customer.dataframe: train
      customer.service_calls_group: "-Below 0"
    sorts: [customer.service_calls_group desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: customer.churn_rate,
            id: customer.churn_rate, name: Churn Rate}], showLabels: true, showValues: false,
        maxValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Service Calls
    hide_legend: true
    font_size: '18'
    series_types: {}
    series_colors:
      customer.churn_rate: "#3FB0D5"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Customers Churned
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 4
    col: 0
    width: 6
    height: 8
  - title: Once Day Charges reach $40, Churn Rate Jumps
    name: Once Day Charges reach $40, Churn Rate Jumps
    model: ml-accelerator-tutorials
    explore: telco_customer_churn
    type: looker_bar
    fields: [customer.churn_rate, customer.total_day_charge_group]
    fill_fields: [customer.total_day_charge_group]
    filters:
      customer.dataframe: train
      customer.service_calls_group: "-Below 0"
    sorts: [customer.total_day_charge_group desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: customer.churn_rate,
            id: customer.churn_rate, name: Churn Rate}], showLabels: true, showValues: false,
        maxValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    hide_legend: true
    font_size: '18'
    series_types: {}
    series_colors:
      customer.churn_rate: "#3FB0D5"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Customers Churned
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 4
    col: 6
    width: 6
    height: 8
  - title: Churn only Slightly Higher in Long-time Users
    name: Churn only Slightly Higher in Long-time Users
    model: ml-accelerator-tutorials
    explore: telco_customer_churn
    type: looker_bar
    fields: [customer.churn_rate, customer.customer_count, customer.account_duration_years_group]
    fill_fields: [customer.account_duration_years_group]
    filters:
      customer.dataframe: train
      customer.service_calls_group: "-Below 0"
    sorts: [customer.account_duration_years_group desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: customer.churn_rate,
            id: customer.churn_rate, name: Churn Rate}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    hide_legend: true
    font_size: '18'
    series_types: {}
    series_colors:
      customer.churn_rate: "#3FB0D5"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Customers Churned
    defaults_version: 1
    hidden_fields: [customer.customer_count]
    listen: {}
    row: 4
    col: 12
    width: 6
    height: 8
