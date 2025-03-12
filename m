Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C94A5D8AE
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Mar 2025 09:54:23 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 554DD160644;
	Wed, 12 Mar 2025 09:54:21 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
	[209.85.128.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9CB17160644
	for <drbd-dev@lists.linbit.com>; Wed, 12 Mar 2025 09:54:15 +0100 (CET)
Received: by mail-yw1-f177.google.com with SMTP id
	00721157ae682-6fee63b9139so6024827b3.1
	for <drbd-dev@lists.linbit.com>; Wed, 12 Mar 2025 01:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1741769654;
	x=1742374454; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=It/qH8DghVpI/xzKyUoDvRcNk+CiHRq5rNhaMlGcrOw=;
	b=YUJgts/FpDdPeX1CjeHfmfmqIKu0wK7tzAYjuNA7EnGel++Iu5P+EDLHCBdhmo+Km+
	EAYrixC5GhpA61j+c5T7S3wIPrRXYt9QCY1/EZqJLSNGxsblCDcmjf6U565beAaJx5ql
	eLqu9WeiniemM5tNs/18dMkyUvgPG/vEyIXQz8o0V1e+qIbw4w/iIyespJMlGu/rlcmJ
	lsIb3z5sBp+n66F98UFjLfjmhs1esg4YxTbBKZiQZwTUmMJMb/bL08StkjNaODFhRL5+
	yBjZ5C/hoENkZCkQw/9t9IblRMvIwfHT5GseC0uw6muFMptPMNV/6XZSgJzi53TqVLPh
	TkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1741769654; x=1742374454;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=It/qH8DghVpI/xzKyUoDvRcNk+CiHRq5rNhaMlGcrOw=;
	b=Bp66yYCh7UV+q5Jbq0YF1sS1nyq41NR8TbSQQWtRw4kPyF9YNmk24gl6yGCYOts5R1
	RMQCE0FFvNd18KP6qUcB57ef+dP2E+nx2uiQoPMiZEtMlXuCxd5W7iWCj1k/yy+deW3x
	kdF26dxrLCuw1czkh8OWRPU1xWuhdGRSRHMjnKBoXKvZMInJ6WTx07mFVwPqIk0YpvIm
	xCsleDRrDeOeHC5sNKmoNSwg1VAU4wC4IdwoUm6RzG4E4L5gK+GQiGHNaeFccnnY7vM+
	3OpTStewx1HoI8AkvlaVTG4OPMIspyWm9Hq0fSm4yrSOV2o0m/gIsj8Th6PZw12bKAhP
	7N1g==
X-Gm-Message-State: AOJu0Yz8q/5uONXHFgm8L1iH7GBahl8wFLaFKApZlAfDFq0nKVBn5Pzq
	zWU4NcOPr4oNPdRv2bbFAl+eI9WY16sqWfXDb3IgeIIMwn0svpCP5ISe8kyLRJtdeyPXxaAa0Au
	YawQ/rKizkyb4F+gIV0o9HL0VOuUi3ps7xmKcNcUejRg5Kr/eDnTYBZwo
X-Gm-Gg: ASbGncuZmSFRZjWkVZgJaPWpaqkUSxaUAyIzKi4i+DQHb08b6BdkClO/mpgbCJExdgO
	xnKpVHjGjjpE4hGNju2X+phahCOftS4GOSsIO2buqK/OuolKD5psCp2EE61mykiXAiY2cYGQ7xf
	h2SZRt/K16e9OAcmrXMtgsT49MZp8ve9qvolew5Q==
X-Google-Smtp-Source: AGHT+IGpUQmMWPUAuhBFoXLvXcXci21JQCvLMOYK1lT5BJViuY9viJptAAOGpJubh7FYhpQO6vlzIC8V4tuvDN5+0lY=
X-Received: by 2002:a05:690c:3144:b0:6fe:d004:e2a3 with SMTP id
	00721157ae682-6ff0a341626mr73967877b3.16.1741769654395; Wed, 12 Mar 2025
	01:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250219030804.1389397-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20250219030804.1389397-1-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Wed, 12 Mar 2025 09:54:03 +0100
X-Gm-Features: AQ5f1Jpt3iXFq8zJ6TBW_x7gP9pQi5_hv-RleFeZWlxUOT-eXFBzoSlRhpAIWfI
Message-ID: <CADGDV=XuS-4bkzvEkqJPT+eVy1=KcKsGDftZ-uRoVKBvF1o3tQ@mail.gmail.com>
Subject: Re: [PATCH] rdma: Fix drbd_transport_rdma module reference count
	exception
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: multipart/alternative; boundary="0000000000008802be063021596d"
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

--0000000000008802be063021596d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied as
https://github.com/LINBIT/drbd/commit/a3807781a29ff488346eed47bd457bbd2cc78=
c91

Thanks!

Best regards,
 Philipp

On Wed, Feb 19, 2025 at 4:13=E2=80=AFAM zhengbing.huang <
zhengbing.huang@easystack.cn> wrote:

> In testing, we find drbd_transport_rdma module reference count is abnorma=
l:
> drbd_transport_rdma 262144 28293
>
> we don't have that many drbd devices.
>
> If the XXX_ADDR_ERROR/XXX_ROUTE_ERROR events occurs
> and the DSB_CONNECTING flag bit is not set,
> the dtr_cma_event_handler() returns 0 directly.
> The cm structure cannot be destroyed,
> and the drbd_transport_rdma module reference count is abnormal.
>
> So, for XXX_ADDR_ERROR/XXX_ROUTE_ERROR events,
> we do not need to judge the DSB_CONNECTING flag,
> and we need to kref_put of cm structure.
>
> Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
> ---
>  drbd/drbd_transport_rdma.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
> index ba4f1baa7..bb59e6501 100644
> --- a/drbd/drbd_transport_rdma.c
> +++ b/drbd/drbd_transport_rdma.c
> @@ -1292,6 +1292,11 @@ static int dtr_cma_event_handler(struct rdma_cm_id
> *cm_id, struct rdma_cm_event
>                 // pr_info("%s: RDMA_CM_EVENT_ADDR_ERROR\n", cm->name);
>         case RDMA_CM_EVENT_ROUTE_ERROR:
>                 // pr_info("%s: RDMA_CM_EVENT_ROUTE_ERROR\n", cm->name);
> +               set_bit(DSB_ERROR, &cm->state);
> +
> +               dtr_cma_retry_connect(cm->path, cm);
> +               break;
> +
>         case RDMA_CM_EVENT_CONNECT_ERROR:
>                 // pr_info("%s: RDMA_CM_EVENT_CONNECT_ERROR\n", cm->name)=
;
>         case RDMA_CM_EVENT_UNREACHABLE:
> --
> 2.43.0
>
>

--0000000000008802be063021596d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Applied as <a href=3D"https://github.com/LINBIT/drbd/commi=
t/a3807781a29ff488346eed47bd457bbd2cc78c91">https://github.com/LINBIT/drbd/=
commit/a3807781a29ff488346eed47bd457bbd2cc78c91</a><br><br>Thanks!<br><br>B=
est regards,<div>=C2=A0Philipp</div></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 19, 2=
025 at 4:13=E2=80=AFAM zhengbing.huang &lt;<a href=3D"mailto:zhengbing.huan=
g@easystack.cn">zhengbing.huang@easystack.cn</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">In testing, we find drbd_transp=
ort_rdma module reference count is abnormal:<br>
drbd_transport_rdma 262144 28293<br>
<br>
we don&#39;t have that many drbd devices.<br>
<br>
If the XXX_ADDR_ERROR/XXX_ROUTE_ERROR events occurs<br>
and the DSB_CONNECTING flag bit is not set,<br>
the dtr_cma_event_handler() returns 0 directly.<br>
The cm structure cannot be destroyed,<br>
and the drbd_transport_rdma module reference count is abnormal.<br>
<br>
So, for XXX_ADDR_ERROR/XXX_ROUTE_ERROR events,<br>
we do not need to judge the DSB_CONNECTING flag,<br>
and we need to kref_put of cm structure.<br>
<br>
Signed-off-by: zhengbing.huang &lt;<a href=3D"mailto:zhengbing.huang@easyst=
ack.cn" target=3D"_blank">zhengbing.huang@easystack.cn</a>&gt;<br>
---<br>
=C2=A0drbd/drbd_transport_rdma.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c<br>
index ba4f1baa7..bb59e6501 100644<br>
--- a/drbd/drbd_transport_rdma.c<br>
+++ b/drbd/drbd_transport_rdma.c<br>
@@ -1292,6 +1292,11 @@ static int dtr_cma_event_handler(struct rdma_cm_id *=
cm_id, struct rdma_cm_event<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // pr_info(&quot;%s=
: RDMA_CM_EVENT_ADDR_ERROR\n&quot;, cm-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case RDMA_CM_EVENT_ROUTE_ERROR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // pr_info(&quot;%s=
: RDMA_CM_EVENT_ROUTE_ERROR\n&quot;, cm-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(DSB_ERROR, =
&amp;cm-&gt;state);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtr_cma_retry_conne=
ct(cm-&gt;path, cm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case RDMA_CM_EVENT_CONNECT_ERROR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // pr_info(&quot;%s=
: RDMA_CM_EVENT_CONNECT_ERROR\n&quot;, cm-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case RDMA_CM_EVENT_UNREACHABLE:<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--0000000000008802be063021596d--
