Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id A38DA91BBB1
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jun 2024 11:40:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE6024203D5;
	Fri, 28 Jun 2024 11:40:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
	[209.85.219.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 018214202BA
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 11:40:42 +0200 (CEST)
Received: by mail-yb1-f178.google.com with SMTP id
	3f1490d57ef6-e035dc23a21so292341276.0
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1719567642;
	x=1720172442; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=AtTk+HfLUWMryV2mo6PbzAvGVXjlNWjVhPXt3bbypv4=;
	b=BCqRTqnQMm1vDKwSv+cxm1qqvfP+VFC2fE9uhTf3gEgB5KSDoosqq77QGcC/PEGRUM
	4mVGQ9zP7bPY9kuoIIN/it/hmN50c/erk3JNXBXIDVnP4M0B7LXRiA2HfjbSV8yJD6kS
	DflZG65jyUKD7eEiJ/OaRSYxzWo8h4pi4oQA2HLTW68ioXKy3PkQ+eVCfCkHnXpNfdfX
	UZjEXgtYNLnQN/ASRl3ujYyFStTzLNErDJAz9Z3w0jwP6KEa1ItFc1SHqwRtfE2/2qbq
	Dna+0hyVRsWBw1iYlrt4BdUdhtjmZJlvV2posT3jUitelSBmR4iSZXAZbQCWetRCTDNr
	Hreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1719567642; x=1720172442;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=AtTk+HfLUWMryV2mo6PbzAvGVXjlNWjVhPXt3bbypv4=;
	b=MeF/K35swZo0My9BAkfYOsZQ8esUTOaqjmFHgTjILNs9RVYbGtxiw9u+NJ1Yw0dvx7
	eW/FMqX8iwRtF2KCRn7kDjTtr2au92U06tX+aPvneon0qloGr0xsguybIuSyzSsHGnvH
	NgvVdR/RjdVpDyBD62DvpwKUwm2E6S4/vQQsRZebnW0aevZYUQOxbdShHcKq523i29Xa
	69JswgrcJpZN8YjpVryfSeRY2pj+1/nlfTAYGtY0bBa+gaVb+q3/BCROZvISFW+/nWpE
	2BqxrfXctHCkyb6XUO3TcCIKU0GE/p8d1l1poD01fcm5lSd8dZbIJgHPjjkg6FjUmsAX
	gEXA==
X-Gm-Message-State: AOJu0YwJ+4CrvlxSuw5tRMTX2160GLEWLel9iaLPfoceNM4/FtLC7OC0
	dueXeBteB2bXC7PLAqOKNU4EuZD6kOMVULmIJfbkVT/n4RdUqNo1oXgV33A7IvnydOs9RWK47w6
	I/Kii3WXFy6BkWc/llhJUzg7ee7yKWyrQFwfBFMrMXhnxoT5l9nqV2Q==
X-Google-Smtp-Source: AGHT+IE8Lakhs2kifzvpWCRH2NaOZT/MDJVS2wUDKbqlAxQwoyJe+IQNGw9hqpFuTJtSe3WB80x0GSf7t7+EgzeU2Qc=
X-Received: by 2002:a25:abec:0:b0:e03:517b:7cf0 with SMTP id
	3f1490d57ef6-e03517b7ea3mr2560361276.25.1719567642216; Fri, 28 Jun 2024
	02:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<20240624054619.23212-3-zhengbing.huang@easystack.cn>
In-Reply-To: <20240624054619.23212-3-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 28 Jun 2024 11:40:31 +0200
Message-ID: <CADGDV=V4kpNPAWf6MsdswhbMqKPe5=qEMXkF_KBqXVM7W+aUhQ@mail.gmail.com>
Subject: Re: [PATCH 03/11] drbd_transport_rdma: put kref for cm in
	dtr_path_established in error path
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

Please add more information why you think this change fixes a bug.
Have you experienced a leak of cm structs?
We got a RDMA_CM_EVENT_ESTABLISHED event. Even if DRBD does not do
anything with this cm, we sill expect a RDMA_CM_EVENT_DISCONNECTED in
the future. Is a problem in the handling of the disconnect?

best regards,
 Philipp

On Mon, Jun 24, 2024 at 9:28=E2=80=AFAM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>
> Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
> ---
>  drbd/drbd_transport_rdma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
> index cfbae0e78..eccd0c6ce 100644
> --- a/drbd/drbd_transport_rdma.c
> +++ b/drbd/drbd_transport_rdma.c
> @@ -922,6 +922,7 @@ static void dtr_path_established(struct dtr_cm *cm)
>                         atomic_set(&cs->active_state, PCS_INACTIVE);
>                         wake_up(&cs->wq);
>                 }
> +               kref_put(&cm->kref, dtr_destroy_cm);
>                 return;
>         }
>
> --
> 2.27.0
>
