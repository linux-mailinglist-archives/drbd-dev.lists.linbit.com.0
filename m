Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 07333A69FE0
	for <lists+drbd-dev@lfdr.de>; Thu, 20 Mar 2025 07:37:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C535216B822;
	Thu, 20 Mar 2025 07:37:02 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
	[209.85.128.173])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 18F1116091D
	for <drbd-dev@lists.linbit.com>; Thu, 20 Mar 2025 07:36:55 +0100 (CET)
Received: by mail-yw1-f173.google.com with SMTP id
	00721157ae682-6f768e9be1aso15717057b3.0
	for <drbd-dev@lists.linbit.com>; Wed, 19 Mar 2025 23:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1742452615;
	x=1743057415; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=ism27ris0WEfK7ehThlT53CYeBTK1lgrXTu8rMlFlBo=;
	b=fdqDAJnrQkCZaUNOdj3cQGrIdW+2sTHETPYQprn0U/RD2xf2k1/G9TvbXm8ikjqN86
	XpU8wFaTQ+V36amu2A/YRTA4s/A102AXl6MSVnkcmiyZfVmBEqutLWdF2urCXKZxQzd+
	0vJwx+FkpyupGgphXrlOrOOEmtE2pC0Pi3kxK730Wzy5Ogc5o2pVXgjIwPtOPbxngUFl
	TBqEjj9aIic1QSZcTocRZcr1eHnpvA3C9gOGHqhumkPi5G6SpJOD9SoyMsAPXuzupmaL
	R8/dEKRcpWvfSV58M137oENF3wL6e1b2W0CFe7ifpd4g8hB1Z27tx8Q0THB4i/FtRe26
	y/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1742452615; x=1743057415;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=ism27ris0WEfK7ehThlT53CYeBTK1lgrXTu8rMlFlBo=;
	b=h5MOj4XjzRGP2Jd9U5+5CpuvPaCpRF5SIQkIwAAOmbPWKg6k3VRokgrunt1Mu9t7Z/
	BItM362IIZHbfS6V5trw+XM2tGo8ADvGR+rFcsQ88o+KqoFN1tNPZqpVTqhHVlOT5QEg
	FJv9pUJPiywBkOFJM8mEqEnM21k4qySAc1G9JtfaTtHQLm5zui5ocZDod4D6xRg5dMVD
	gRxIkRsdfpwZtX4iuX/HPS10F5ANC2m/Hfk3FhTUwH6YLxXwkPDxwSPHCKiSzSj82TUi
	8X9JTvCdP8hQG7+zFAklBy1lQ28DiG6A3QruTlHlJ2t6QnjCcjmHph1OsUxh+qpqYLdm
	+k/A==
X-Gm-Message-State: AOJu0YzHKHjeEyojvHJ4HonYId0zv8M7zJ+CSFHOvfN/+6tQh3sJkrJ4
	CAB/EAGauN7fuSTX2TBpJWx478WMEYR5cIMz6ob50NKL+QFlLw+lehuKJtaJXQ3VUzYFhWJ1rAQ
	LkSn12P25vZie6g3pLKH63CwvtU4hdpkbKGSxPm+0J0X8CGB2yMAVt5gV
X-Gm-Gg: ASbGnctdc94ItIq7d+a93Bz3k/TdMCfJYFWg+DV1KYBm87DXp+lBH/Gijqw+nqTrYzq
	OKV99qT63uyeSiiSgP/y3Lus8saUy1RiAt8NVbOqFQ57k6Wifstf1PlYFhXSxRhEJ2n2HCPe4eW
	3XnDTL7n1qIW1L0ssqz5jMyh8pTQg=
X-Google-Smtp-Source: AGHT+IGjDS0lp1f267+1LYAtq/xeD3npr22Vf43MuKbyvzv9yoD45+FAtGANKWFEdpxlgXrEKfB5chSRofrJ9rpfOMg=
X-Received: by 2002:a05:690c:d84:b0:6f9:492e:94db with SMTP id
	00721157ae682-700ab25f2d5mr31029497b3.2.1742452615121; Wed, 19 Mar 2025
	23:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250219030506.1389085-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20250219030506.1389085-1-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Thu, 20 Mar 2025 07:36:44 +0100
X-Gm-Features: AQ5f1JoAPnnvVMZ9aektPNi70q-xN8RxQqibFkwHLXmJ52ynMLpQI4xpLe8a8Bw
Message-ID: <CADGDV=VV6yf56iQQJ4vw2Y250ORjgkzCt0KdgmUezcu+oogTLA@mail.gmail.com>
Subject: Re: [PATCH] drbd: Fix IO block after network failure
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Zhengbing,

Yes, I verified your findings and applied this patch with tiny
modifications to make it checkpatch.pl compliant.
https://github.com/LINBIT/drbd/commit/4e28788df7f935ed78042f74b0969dd7fc0c7=
eb7

Thanks!

Best regards,
 Philipp


On Wed, Feb 19, 2025 at 4:10=E2=80=AFAM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> Network failure test, I/O is not finished.
> The oldest_request has follow status information:
>
> master: pending|postponed       local: in-AL|completed|ok       net[1]: q=
ueued|done : C|barr
>
> This req also has RQ_NET_QUEUED,so its reference count
> cannot be reduced to zero and req cannot complete.
>
> The commit 8962f7c03c1
> drbd: exclude requests that are not yet queued from "seen_dagtag_sector"
> has modify the __next_request_for_connection() function,
> which causes the sender thread to be unable to clean up all
> pending req when the network failure.
>
> The race occurred as follows, where T is a submit req thread,
> and S is a sender thread:
> S: process_one_request() handle r0
> S: network failure. drbd_send_dblock(r0) fail, then call __req_mod(r0, SE=
ND_FAILED...)
> S: Call mod_rq_state(), r0 clear RQ_NET_QUEUED, and still has RQ_NET_PEND=
ING
> T: r1 arrive drbd_send_and_submit(), add to transfer_log, and set RQ_NET_=
QUEUED
> S: drbd_sender() handle network failure, change_cstate(C_NETWORK_FAILURE)
>
> When sender thread state change to stop, and want to
> cleanup all currently unprocessed requests(call __req_mod(req, SEND_CANCE=
LED...)).
> but it can not find r1, because in the __next_request_for_connection() fu=
nction,
> r0 always satisfies the first if condition and returns NULL.
> static struct drbd_request *__next_request_for_connection(...)
> {
> ...
>                 if (unlikely(s & RQ_NET_PENDING && !(s & (RQ_NET_QUEUED|R=
Q_NET_SENT))))
>                         return NULL;
> ...
> }
> Finally, r1 could not be completed due to has RQ_NET_QUEUED.
>
> So, In the cleanup process of sender,
> we find all the req with RQ_NET_QUEUED and clean it.
>
> Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
> ---
>  drbd/drbd_sender.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drbd/drbd_sender.c b/drbd/drbd_sender.c
> index 80badc606..e6fc751c7 100644
> --- a/drbd/drbd_sender.c
> +++ b/drbd/drbd_sender.c
> @@ -3251,6 +3251,24 @@ static struct drbd_request *tl_next_request_for_co=
nnection(struct drbd_connectio
>         return connection->todo.req;
>  }
>
> +static struct drbd_request *tl_next_request_for_cleanup(struct drbd_conn=
ection *connection)
> +{
> +       struct drbd_request *req;
> +       struct drbd_request *found_req =3D NULL;
> +
> +       list_for_each_entry_rcu(req, &connection->resource->transfer_log,=
 tl_requests) {
> +               unsigned s =3D req->net_rq_state[connection->peer_node_id=
];
> +
> +               if (s & RQ_NET_QUEUED) {
> +                       found_req =3D req;
> +                       break;
> +               }
> +       }
> +
> +       connection->todo.req =3D found_req;
> +       return connection->todo.req;
> +}
> +
>  static void maybe_send_state_afer_ahead(struct drbd_connection *connecti=
on)
>  {
>         struct drbd_peer_device *peer_device;
> @@ -3644,7 +3662,7 @@ int drbd_sender(struct drbd_thread *thi)
>         /* cleanup all currently unprocessed requests */
>         if (!connection->todo.req) {
>                 rcu_read_lock();
> -               tl_next_request_for_connection(connection);
> +               tl_next_request_for_cleanup(connection);
>                 rcu_read_unlock();
>         }
>         while (connection->todo.req) {
> @@ -3660,7 +3678,7 @@ int drbd_sender(struct drbd_thread *thi)
>                         complete_master_bio(device, &m);
>
>                 rcu_read_lock();
> -               tl_next_request_for_connection(connection);
> +               tl_next_request_for_cleanup(connection);
>                 rcu_read_unlock();
>         }
>
> --
> 2.43.0
>
