# Hetzner May 2018 Outage

If you're a [Hetzner](https://hetzner.de) hosting customer in Germany or elsewhere, you're likely to describe the service as reliable and simple to manage. You're also likely to recommend it for its reasonable pricing for bare compute and bandwidth services that Amazon and Google have yet to match. However, after the May 2018 power outage that affected all of the Hetzner primary datacenters in near Nuremberg, there are lessons to be learned, especially for dedicated server customers.

## Infrastructure Outage

An outage of this type typically affects shared resources at the datacenter level. Since DC07, DC10, DC12 source power from the same grid in Falkenstein, a problem with the grid affected all data centers in a similar fashion highlighting the grid as a single point of failure.

In this particular case the short-lived voltage spike caused a shutdown of the network gear and dedicated servers in Hetzner datacenters. The UPS backups failed to work for reasons to be investigated. While the network services were restarted relatively quickly, the outage into hours and even days. As it happened, many dedicated servers some of which went down during the power outage, others taken down by customers in a futile attempt to reboot the servers with hardware resets, failed to boot.

Here's what happened to some of our servers after the tickets were addressed by Hetzner support.

```txt
Your server was stuck initializing the raid controller. After a reboot your server is back online.
# Downtime 9 hours
```

```txt
It was not starting any more so we had to replace it completely except for the drives. Now your OS is reachable again.
# Downtime: 32 hours
```

## Hetzner Status

The power outage was reported on May 24, 2018 at 09:30 UTC and affected a lot of customers, both physical as well as virtual.

We filed our tickets for each affected server and watched Hetzner status page, a saved PDF copy of which is linked [here](./resources/hetzner-status.pdf) for reference. As it became clear that the outage will last more than a few hours we started planning for the worst case at which point we need to estimated how much time it will take Hetzner support to fix our machines given their processing rate. At some point Hetzner started releasing reports about pending outage tickets.

![](./images/ticket_count.png)

[![](./images/button.png)](https://apps.axibase.com/chartlab/984e6935/5#fullscreen)

## Time to Resolve

We used the reported counters as inputs to arrive at a rough TTR estimate by dividing the ticket count by the hourly rate, calculated as the delta from the previous report.

```javascript
hourly_rate = -1 * (ticket_count - previous_ticket_count);
hours_to_fix = ticket_count / rate;
```

The reports were hourly but had large gaps around night time suggesting a shortage of resources during local non-business hours.

To adjust for the irregularity, we normalized the rate (time fields below are reported in milliseconds).

```javascript
hourly_rate = -1 * (ticket_count - previous_ticket_count)/(current_time - previous_time)*60*60000;
hours_to_fix = ticket_count / hourly_rate
```

We plugged the formulas into the `replace-value` setting and calculated the time-to-repair by dividing count by the first derivative. This assumes that our servers will be the last to be fixed - a true 'lucky winners' of the worst cast scenario.

![](./images/ticket_rate_dc07.png)

[![](./images/button.png)](https://apps.axibase.com/chartlab/984e6935/7#fullscreen)

P.S. Our servers were recovered earlier than that, the biggest outage lasted 32 hours.