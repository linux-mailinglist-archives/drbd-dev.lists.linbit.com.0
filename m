Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC8B91BE2D
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jun 2024 14:07:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D1D74202BA;
	Fri, 28 Jun 2024 14:07:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
	[209.85.219.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 600564202BA
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 14:07:35 +0200 (CEST)
Received: by mail-yb1-f179.google.com with SMTP id
	3f1490d57ef6-dff0712ede2so493279276.2
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1719576455;
	x=1720181255; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=pnVKLWXdJDOmGF59HkVX+Rp1HPjo8Cy+BwsPa2lnLGo=;
	b=R/sDJMagvATcYls4ztb7y4Z0jpNI7cetcnpgSudD5qcT8BUvcpr6D5M2P1F+/1MEOW
	w9966tMGo/ZEhfXQFMoSiViEPIyTBhFqGxDKKDVC1zwwcl/TQW27Z2XhVPXHR61/yjfJ
	wdFEl4DQ5/gutrKHHfWe+mNK7zHPBHLo5JVNqTCv19axT5WR4iIJkfSu81Pdz2Q1kfht
	ROHxCvEamxgRSpT5OaLW1ljtQDSRNO+N49rVb/6YRB7Tp9tXcnHiBl1V2dgkpaxRU2Z1
	MuAKRuBMQkJp9fDf0Vpi3HoLSf+cBEzppybMkru+DyCBg8yB2jQKzqQ9ejihF91XuUuo
	/BBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1719576455; x=1720181255;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=pnVKLWXdJDOmGF59HkVX+Rp1HPjo8Cy+BwsPa2lnLGo=;
	b=d4XCzKTwjtgp5cg5jQaDmzSDKwX6I/zDecfG9l0v2eYHCxx7EVf6Uz/fcL0qIyGuco
	OAZx+Hk9EpyHBl1IoXa2h12I1txYx6ozzHjpr34bSroAOeg2dFerPQZnqsWcQBe3tMkj
	ezwbk3FVm5TejIMsWzqHRMzwDBE06ZQ9rRfp10jeOjEQWlU4wZixBUH0cn2FiRGhvXfv
	O/TWq1Mj6BcnQxXQjo0m0fBXVbCV2h0kfkSNqeudqrT78kDO2fQip9ZIdcZ5/jTVkqg1
	vfpoyjjLa3ADSYHUJI1pzm7wSGmQwe/RTz9GLkzDzj27iA+hUJd9qJy5iuwjkXRphC33
	qsfA==
X-Gm-Message-State: AOJu0YxXiC9YMNDqhPzt2BPcb0igfknhEN3m0Q3Nl11tqds2NCbzbpqw
	JDdgb6d8hZy+ywt2X2WEHGN8Tt0NxDoVytwT7DLjZG06elgn3zdUXuqVhvYA28yCOnKxbUl6hm8
	C/RNRMpJd08zgLhkHvWpZhNA4igYwk73CiziL3Y5grGYNK0nEU7HhbA==
X-Google-Smtp-Source: AGHT+IFbB9qmiUWlg8QIsw1l+hQDQMOx+pdxRIpjEKwMTxlLHQtuNwcAUnqxCm16CbPDIz/Jqcb/sR4DfXCl1gGcDUQ=
X-Received: by 2002:a25:57:0:b0:e03:6442:cb7c with SMTP id
	3f1490d57ef6-e036442ccdcmr334226276.16.1719576455176; 
	Fri, 28 Jun 2024 05:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<20240624054619.23212-5-zhengbing.huang@easystack.cn>
In-Reply-To: <20240624054619.23212-5-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 28 Jun 2024 14:07:24 +0200
Message-ID: <CADGDV=XCh8QLqYZ0-zddu6nwdJJor9UGb960K-CmN5yLB58XzA@mail.gmail.com>
Subject: Re: [PATCH 05/11] drbd_transport_rdma: dont break in
	dtr_tx_cq_event_handler if (cm->state != DSM_CONNECTED)
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Dongsheng Yang <dongsheng.yang@easystack.cn>, drbd-dev@lists.linbit.com
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

Hello Dongsheng,

It appears that you are trying to fix a leak of cm structures. Is that corr=
ect?
Do you the reference on cm that is held because of the timer?
Please describe what the problem is, and how you are improving the situatio=
n.

In case this approach is the right solution, the patch should also change t=
he
dtr_handle_tx_cq_event() function to type void.

best regards,
 Philipp

On Mon, Jun 24, 2024 at 8:22=E2=80=AFAM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>
> We need to drain all tx in disconnect to put all kref for cm
>
> Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
> ---
>  drbd/drbd_transport_rdma.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
> index b7ccb15d4..9a6d15b78 100644
> --- a/drbd/drbd_transport_rdma.c
> +++ b/drbd/drbd_transport_rdma.c
> @@ -1956,9 +1956,6 @@ static void dtr_tx_cq_event_handler(struct ib_cq *c=
q, void *ctx)
>                         err =3D dtr_handle_tx_cq_event(cq, cm);
>                 } while (!err);
>
> -               if (cm->state !=3D DSM_CONNECTED)
> -                       break;
> -
>                 rc =3D ib_req_notify_cq(cq, IB_CQ_NEXT_COMP | IB_CQ_REPOR=
T_MISSED_EVENTS);
>                 if (unlikely(rc < 0)) {
>                         struct drbd_transport *transport =3D cm->path->pa=
th.transport;
> --
> 2.27.0
>
