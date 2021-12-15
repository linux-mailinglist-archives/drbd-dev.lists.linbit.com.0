Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 94361478674
	for <lists+drbd-dev@lfdr.de>; Fri, 17 Dec 2021 09:47:36 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7AEB6420367;
	Fri, 17 Dec 2021 09:47:35 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0F9A6420954
	for <drbd-dev@lists.linbit.com>; Wed, 15 Dec 2021 20:38:49 +0100 (CET)
Received: by mail-lf1-f45.google.com with SMTP id d10so45194752lfg.6
	for <drbd-dev@lists.linbit.com>; Wed, 15 Dec 2021 11:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=fOcjE2pXavuKbJCrwB9ewcw0SQq3JyvpjoJ4QyUms+k=;
	b=o5dMU0DcaUlE+/2CiW05vzfTnr1Z77oVBKfCUQNAWnB/OsBNdI4o54ecYJjM75u9vg
	rumPl1ANlnY1sGQ5A8QVq5e3qtaAm8tQdpLkLl6uwWVNO1qOYYy6subpsVjKQTyVYwaF
	03H1MXlzz7LF7VHLRfMSOkuPwwpEwN2pV2cy+59gHDAcZluJ4dV2vm3VfCKKzjP4D1CO
	dVef13FjgFkkTF+9AKC/EoeP86pYpw3adJVaB3Tb4Oh/qNDgjSA3rT63sUTaCPG2OuPy
	BKEnXMGA8P0cCLGpbAjuV2s0vSeIsxQblkAns4Dko7VUXD3bBpkBCVsAGh0oAizWbzcL
	2j/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=fOcjE2pXavuKbJCrwB9ewcw0SQq3JyvpjoJ4QyUms+k=;
	b=C1LhNquon5gkZV6EhI+PsQKNzERjFdaqldF4ttBenQnw8uK6NUJ2YHq4ejZxQIx3po
	S8o5GhukkyA6ZgzKPFCA5Fmlis9ls4nSzuQMkoQenh/DnerN0SWWFgqfYryzswJmZ/WG
	4CtIb9MVaKbt/MVB6AsK7ZlFBeMp6gHJjjqzarqlC4R+Z+tZHASgfF8DIUIDQeu652yq
	5r3T1fdmDKcXjtnGAPyarJm+ENSkhXfSXRNQct1J8PGOiBlZchs8rXx5D1o/aotSliJs
	5H8/HnTzAKAz42LBKWWKopNecr86AV1yfUgs+7ZgbpQTm2Q4EqLnTxd7/ibIeA0RN2Ty
	errw==
X-Gm-Message-State: AOAM533RXGisecDk/ffo/1b+roOKaAonVcU7sM4nFsXYoPpWMjNj9TtV
	o2I63hfvGPukgsXAhBS5aJ0=
X-Google-Smtp-Source: ABdhPJxHpQcpecZHC7OldNt5DYzoOYI16J+5esNrAprCo/D3ilVrZV5uhXycQ2Cd340qZ/0p+0tZhA==
X-Received: by 2002:a05:6512:2347:: with SMTP id
	p7mr11387141lfu.304.1639597129414; 
	Wed, 15 Dec 2021 11:38:49 -0800 (PST)
Received: from pc638.lan (h5ef52e3d.seluork.dyn.perspektivbredband.net.
	[94.245.46.61]) by smtp.gmail.com with ESMTPSA id
	u22sm463719lff.118.2021.12.15.11.38.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Dec 2021 11:38:48 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Wed, 15 Dec 2021 20:38:46 +0100
To: Jens Axboe <axboe@kernel.dk>, Philipp Reisner <philipp.reisner@linbit.com>,
	Jason Gunthorpe <jgg@nvidia.com>, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org
Message-ID: <YbpERiPKO4ufe1hf@pc638.lan>
References: <20211215111845.2514-1-urezki@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215111845.2514-1-urezki@gmail.com>
X-Mailman-Approved-At: Fri, 17 Dec 2021 09:47:33 +0100
Cc: Michal Hocko <mhocko@suse.com>, "Theodore Y . Ts'o" <tytso@mit.edu>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, RCU <rcu@vger.kernel.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joel Fernandes <joel@joelfernandes.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Neeraj Upadhyay <neeraju@codeaurora.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Daniel Axtens <dja@axtens.net>
Subject: Re: [Drbd-dev] [PATCH] drdb: Switch to kvfree_rcu() API
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Wed, Dec 15, 2021 at 12:18:37PM +0100, Uladzislau Rezki (Sony) wrote:
> Instead of invoking a synchronize_rcu() to free a pointer
> after a grace period we can directly make use of new API
> that does the same but in more efficient way.
> 
> TO: Jens Axboe <axboe@kernel.dk>
> TO: Philipp Reisner <philipp.reisner@linbit.com>
> TO: Jason Gunthorpe <jgg@nvidia.com>
> TO: drbd-dev@lists.linbit.com
> TO: linux-block@vger.kernel.org
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  drivers/block/drbd/drbd_nl.c       | 9 +++------
>  drivers/block/drbd/drbd_receiver.c | 6 ++----
>  drivers/block/drbd/drbd_state.c    | 3 +--
>  3 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index 44ccf8b4f4b2..28f4d84945fd 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -1679,8 +1679,7 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
>  			drbd_send_sync_param(peer_device);
>  	}
>  
> -	synchronize_rcu();
> -	kfree(old_disk_conf);
> +	kvfree_rcu(old_disk_conf);
>  	kfree(old_plan);
>  	mod_timer(&device->request_timer, jiffies + HZ);
>  	goto success;
> @@ -2511,8 +2510,7 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
>  
>  	mutex_unlock(&connection->resource->conf_update);
>  	mutex_unlock(&connection->data.mutex);
> -	synchronize_rcu();
> -	kfree(old_net_conf);
> +	kvfree_rcu(old_net_conf);
>  
>  	if (connection->cstate >= C_WF_REPORT_PARAMS) {
>  		struct drbd_peer_device *peer_device;
> @@ -2925,8 +2923,7 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
>  		new_disk_conf->disk_size = (sector_t)rs.resize_size;
>  		rcu_assign_pointer(device->ldev->disk_conf, new_disk_conf);
>  		mutex_unlock(&device->resource->conf_update);
> -		synchronize_rcu();
> -		kfree(old_disk_conf);
> +		kvfree_rcu(old_disk_conf);
>  		new_disk_conf = NULL;
>  	}
>  
> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
> index 1f740e42e457..d73a53242a75 100644
> --- a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -3799,8 +3799,7 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
>  		drbd_info(connection, "peer data-integrity-alg: %s\n",
>  			  integrity_alg[0] ? integrity_alg : "(none)");
>  
> -	synchronize_rcu();
> -	kfree(old_net_conf);
> +	kvfree_rcu(old_net_conf);
>  	return 0;
>  
>  disconnect_rcu_unlock:
> @@ -4168,8 +4167,7 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
>  
>  			rcu_assign_pointer(device->ldev->disk_conf, new_disk_conf);
>  			mutex_unlock(&connection->resource->conf_update);
> -			synchronize_rcu();
> -			kfree(old_disk_conf);
> +			kvfree_rcu(old_disk_conf);
>  
>  			drbd_info(device, "Peer sets u_size to %lu sectors (old: %lu)\n",
>  				 (unsigned long)p_usize, (unsigned long)my_usize);
> diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
> index b8a27818ab3f..826e496821c7 100644
> --- a/drivers/block/drbd/drbd_state.c
> +++ b/drivers/block/drbd/drbd_state.c
> @@ -2071,8 +2071,7 @@ static int w_after_conn_state_ch(struct drbd_work *w, int unused)
>  		conn_free_crypto(connection);
>  		mutex_unlock(&connection->resource->conf_update);
>  
> -		synchronize_rcu();
> -		kfree(old_conf);
> +		kvfree_rcu(old_conf);
>  	}
>  
>  	if (ns_max.susp_fen) {
> -- 
> 2.30.2
> 
+ Jens Axboe <axboe@kernel.dk>
+ Philipp Reisner <philipp.reisner@linbit.com>
+ Jason Gunthorpe <jgg@nvidia.com>
+ drbd-dev@lists.linbit.com
+ linux-block@vger.kernel.org

--
Vlad Rezki
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
