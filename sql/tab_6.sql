select
    ushow.adjusted_show_name as initShow,
    ushow1.adjusted_show_name as compShow,
    temp3.numClient

from (
    select
    temp1.vendor_id as initVend,
    temp2.vendor_id as otherVend,
    count(temp2.client_id) as numClient

    from (
        select
            client_id,
            vendor_id,
            sum(ace_cost),
            1 as spend_indicator

        from production.public.rawdata_non_invoice_2014to2018_cond
        where
            ace_cost > 300
            and week_beginning_date > current_date - 365
        group by
            client_id, vendor_id
        order by
            client_id, vendor_id
        ) as temp1

    left join (
        select
            client_id,
            vendor_id,
            sum(ace_cost),
            1 as spend_indicator

        from production.public.rawdata_non_invoice_2014to2018_cond
        where
            ace_cost > 300
            and week_beginning_date > current_date - 365
        group by
            client_id, vendor_id
        order by
            client_id, vendor_id
            ) as temp2


    on temp1.client_id = temp2.client_id
    group by temp1.vendor_id, temp2.vendor_id
) as temp3

left join production.gsheet.unique_shows as ushow
on ushow.vendor_id = temp3.initVend

left join production.gsheet.unique_shows as ushow1
on ushow1.vendor_id = temp3.otherVend

where
    temp3.initVend <> temp3.otherVend
    and temp3.numClient > 5
    and ushow.adjusted_show_name is not null
    and ushow1.adjusted_show_name is not null

group by 
    ushow.adjusted_show_name,
    ushow1.adjusted_show_name,
    temp3.numClient
order by 
    temp3.numClient desc

