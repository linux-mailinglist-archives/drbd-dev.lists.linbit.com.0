Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A19A1010
	for <lists+drbd-dev@lfdr.de>; Wed, 16 Oct 2024 18:49:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 56BD542090B;
	Wed, 16 Oct 2024 18:49:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ED7FA4202CC
	for <drbd-dev@lists.linbit.com>; Wed, 16 Oct 2024 18:48:59 +0200 (CEST)
Received: by mail-lf1-f54.google.com with SMTP id
	2adb3069b0e04-539e690479cso5317e87.3
	for <drbd-dev@lists.linbit.com>; Wed, 16 Oct 2024 09:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1729097339;
	x=1729702139; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=aDy+fOH0oheehDhd2lpwdRssmzx/hphVJ/j3s0ivs4Y=;
	b=Rb2tP8hBpT+7UnQoKw4AcGIuaIUN+7rRApe27iMxXOAfMcPLpZqWqyo+YPIa1vyVVk
	apQ3FtlS81O7wqGF/RAvQAutdaCb90RwebIE/yZuuwIdu+6eJVFVSpfq3Y2saen6Jj1u
	dxGdA3Mz93JUyI0kaZ+BV4ZJoCHxt0cTh0m5Py2b2GkVr4IMDD7YjdA2UmJ3FKRssvkX
	NOUTSQ5dyMPgpvUZZZ6dEfVCJkJiuYWxED13MGq5U3xbblKby4b+/nd3HIRviJf69YtS
	ZUTDm4t1odgZWuKehxJhUeQHYNkKAiQTIUTxOP9VP80Llvqf+Ly2XqqLZMZSUefEEtZH
	QH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1729097339; x=1729702139;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=aDy+fOH0oheehDhd2lpwdRssmzx/hphVJ/j3s0ivs4Y=;
	b=XKLUzyp3nNsBw7VRCrkl8hcFDQYsO3uM3GlHpMM0dsYCahBN4FtXcKpibuW4hfsC0h
	wMJlmFFuhdjHm4gBmo03s5CrfO9ylu7fIVASvRzIgGbcJnh2AyWV9iM+g1gHgRl5R4jQ
	iLJv4fRuQ5vvLurvLEiofVEqSE2uYrWTplegZfDIDPgb2sJ5jPhjEIxMLbgWJT+w+6UH
	KS5JVlEchBqimbEab6d7VOllTDNq4wueU/BAi4T4Pqz0ypnAabtu88E9BD+djo43X0RN
	Q9CHP1sJbkNbWtwVkC0RXhgLfn1ElKDdLokkFIizZmZCiVgPUXRRE1uNRDdI9dWe/162
	E95Q==
X-Gm-Message-State: AOJu0Yy4pcNuxcyKk2+ECqTQHg6ZTv57u6+3MizpG4YHGgL3P+dODbsO
	u5TGgyrSQAsr5aWS6BsZ88Kq/KkoRcB1WIkPaaQXi8t9fFW3kr8CzG9HXO9xwcvQDA9XXvfKI79
	vA5sqUmFW39TvCEIpH1TrvOla6+kBKsiSbe8A3YWVkIf1FuoDpW2eKg==
X-Google-Smtp-Source: AGHT+IGH0KJx45EE6UkG72l4qp4iOGcSYhKFv3Oy9uX1wZivgGyxsdyIGEUmxhcHackvK0pmraMthwDmpG3X6v/cJgw=
X-Received: by 2002:a05:6512:3351:b0:539:e38f:28e4 with SMTP id
	2adb3069b0e04-539e571dad0mr6518355e87.45.1729097339078; Wed, 16 Oct 2024
	09:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240914054354.13236-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20240914054354.13236-1-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Wed, 16 Oct 2024 18:48:26 +0200
Message-ID: <CADGDV=Xm1t381KRjTqOZj_t1puczxeXPrtCF3xdfLY-7+JUXOg@mail.gmail.com>
Subject: Re: [PATCH] rdma: Fix multiple disk performance degradation
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

My impression is that using the port number to distribute the IRQs is
a hack. What about allocating an array and tracking how many CMs got
assigned to each IRQ, and always using the IRQ number that is used by
the least number of other CMs?

best regards,
 Philipp

On Sat, Sep 14, 2024 at 8:12=E2=80=AFAM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> In the performance test of rdma mode, we found that when
> two drbd disks were simultaneously subjected to high-pressure I/O write,
> the IOPS of each drbd disk would be reduced by half.
>
> The reason is that if the cq_attr.comp_vector parameter
> is not specified when rdma create send_cq and recv_cq,
> cq will be allocated to the same irq for processing.
> At this point, if multiple disks are stress tested at the same time,
> irq will not be processed in a timely manner
> and performance will decrease.
>
> The solution is to use the network port number as the index of the comp_v=
ector,
> so that the cq of each disk can be distributed across different IRQs
>
> Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
> ---
>  drbd/drbd_transport_rdma.c | 44 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 4 deletions(-)
>
> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
> index 813787c28..8915e60d1 100644
> --- a/drbd/drbd_transport_rdma.c
> +++ b/drbd/drbd_transport_rdma.c
> @@ -2486,10 +2486,43 @@ static int dtr_init_flow(struct dtr_path *path, e=
num drbd_stream stream)
>         return err;
>  }
>
> +static int dtr_get_my_port(struct dtr_path *path)
> +{
> +       int port =3D 0;
> +       struct sockaddr_storage *addr =3D (struct sockaddr_storage *)&pat=
h->path.my_addr;
> +
> +       if (addr->ss_family =3D=3D AF_INET6) {
> +               const struct sockaddr_in6 *v6a =3D (const struct sockaddr=
_in6 *)addr;
> +
> +               port =3D be16_to_cpu(v6a->sin6_port);
> +       } else /* AF_INET, AF_SSOCKS, AF_SDP */ {
> +               const struct sockaddr_in *v4a =3D (const struct sockaddr_=
in *)addr;
> +
> +               port =3D be16_to_cpu(v4a->sin_port);
> +       }
> +
> +       return port;
> +}
> +
> +static void dtr_get_comp_vectors(struct dtr_path *path, int cq_num, int =
*comp_vectors)
> +{
> +       int i;
> +       int tmp_comp_vector =3D dtr_get_my_port(path) * cq_num;
> +
> +       for (i =3D 0; i < cq_num; i++) {
> +               comp_vectors[i] =3D tmp_comp_vector + i;
> +       }
> +
> +       return;
> +}
> +
>  static int _dtr_cm_alloc_rdma_res(struct dtr_cm *cm,
>                                     enum dtr_alloc_rdma_res_causes *cause=
)
>  {
> -       int err, i, rx_descs_max =3D 0, tx_descs_max =3D 0;
> +       int err, i, cq_index =3D 0, rx_descs_max =3D 0, tx_descs_max =3D =
0;
> +       int cq_num =3D 2; /* recv_cq and send_cq */
> +       int comp_vectors[2] =3D {0}; /* recv_cq and send_cq */
> +       struct ib_device *device =3D cm->id->device;
>         struct ib_cq_init_attr cq_attr =3D {};
>         struct dtr_path *path =3D cm->path;
>
> @@ -2504,16 +2537,18 @@ static int _dtr_cm_alloc_rdma_res(struct dtr_cm *=
cm,
>         /* in 4.9 ib_alloc_pd got the ability to specify flags as second =
param */
>         /* so far we don't use flags, but if we start using them, we have=
 to be
>          * aware that the compat layer removes this parameter for old ker=
nels */
> -       cm->pd =3D ib_alloc_pd(cm->id->device, 0);
> +       cm->pd =3D ib_alloc_pd(device, 0);
>         if (IS_ERR(cm->pd)) {
>                 *cause =3D IB_ALLOC_PD;
>                 err =3D PTR_ERR(cm->pd);
>                 goto pd_failed;
>         }
>
> +       dtr_get_comp_vectors(path, cq_num, comp_vectors);
>         /* create recv completion queue (CQ) */
>         cq_attr.cqe =3D rx_descs_max;
> -       cm->recv_cq =3D ib_create_cq(cm->id->device,
> +       cq_attr.comp_vector =3D comp_vectors[cq_index] % device->num_comp=
_vectors;
> +       cm->recv_cq =3D ib_create_cq(device,
>                         dtr_rx_cq_event_handler, NULL, cm,
>                         &cq_attr);
>         if (IS_ERR(cm->recv_cq)) {
> @@ -2524,7 +2559,8 @@ static int _dtr_cm_alloc_rdma_res(struct dtr_cm *cm=
,
>
>         /* create send completion queue (CQ) */
>         cq_attr.cqe =3D tx_descs_max;
> -       cm->send_cq =3D ib_create_cq(cm->id->device,
> +       cq_attr.comp_vector =3D comp_vectors[cq_index++] % device->num_co=
mp_vectors;
> +       cm->send_cq =3D ib_create_cq(device,
>                         dtr_tx_cq_event_handler, NULL, cm,
>                         &cq_attr);
>         if (IS_ERR(cm->send_cq)) {
> --
> 2.17.1
>
