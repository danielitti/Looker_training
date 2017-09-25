connection: "hawking_presentation"
label: "Looker"
explore: training_set {
  label: "Looker Training Set 📗📘📙"
}
view: training_set {
  derived_table: {
    sql:
      select
          1 as employee_number,
          'Joan of Arc' as name,
          'Executive' as department,
          35000 as salary,
          2008 as hired_year,
          'F' as gender
      union all
      select
          2 as employee_number,
          'Winston Churchill' as name,
          'Executive' as department,
          25000 as salary,
          2009 as hired_year,
          'M' as gender
      union all
      select
          3 as employee_number,
          'Karl Marx' as name,
          'Finance' as department,
          25000 as salary,
          2009 as hired_year,
          'M' as gender
      union all
      select
          4 as employee_number,
          'Mother Teresa' as name,
          'HR' as department,
          16000 as salary,
          2010 as hired_year,
          'F' as gender
      union all
      select
          5 as employee_number,
          'Barbra Streisand' as name,
          'Sales' as department,
          16000 as salary,
          2010 as hired_year,
          'F' as gender
      union all
      select
          6 as employee_number,
          'Elvis Presley' as name,
          'Sales' as department,
          8000 as salary,
          2012 as hired_year,
          'M' as gender
      union all
      select
          7 as employee_number,
          'Katy Perry' as name,
          'Analytics' as department,
          8000 as salary,
          2012 as hired_year,
          'F' as gender
      union all
      select
          8 as employee_number,
          'Justin Bieber' as name,
          'Analytics' as department,
          8000 as salary,
          2012 as hired_year,
          'M' as gender
       ;;
  }
  ##  DIMENSIONS  ##
  dimension: name {
    sql: ${TABLE}.name ;;
  }
  dimension: department {
    sql: ${TABLE}.department ;;
  }
  dimension: salary {
    type: number
    sql: coalesce(${TABLE}.salary,0) ;;
    value_format_name: usd_0
  }
  dimension: gender {
    sql: ${TABLE}.gender ;;
  }
  dimension: hired_year {
    type: number
    sql: ${TABLE}.hired_year ;;
  }
  ##  MEASURES  ##
  measure: employee_count {
    type: count
    drill_fields: [detail*]
  }
  measure: average_salary {
    type: average
    value_format_name: usd_0
    sql: ${salary} ;;
  }
  measure: total_salary {
    type: sum
    value_format_name: usd_0
    sql: ${salary} ;;
  }
  set: detail {
    fields: [name, department, salary, hired_year]
  }
}
