Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFEA4F7D40
	for <lists+drbd-dev@lfdr.de>; Thu,  7 Apr 2022 12:48:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EAC4042097C;
	Thu,  7 Apr 2022 12:48:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8AF1642011D
	for <drbd-dev@lists.linbit.com>; Thu,  7 Apr 2022 12:48:23 +0200 (CEST)
Received: by mail-ed1-f53.google.com with SMTP id x20so5883518edi.12
	for <drbd-dev@lists.linbit.com>; Thu, 07 Apr 2022 03:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vEsW32E1SVLlER+oBTv6KdFwS0s/P4kF++msdPMsZQs=;
	b=0PpM/05Lf7D0rPDO+tVEoOTYoesPA48z6TTtXyngFys/K3hkX8J3UuzVXLNn8RwUr+
	OsZQwBZLiRET8DmXRItS4b0jnDyU+FZ3/NwU+EC6Eyxr3rw3mEjEXfiZwgrixnUIonba
	6otnDPersgAOh7CY3KS8PiAOy72Zj/66q6fgFl46+gXVLFM2HbDEf4mHNwGnL8OuTaW1
	99B6ivdeGKsNv6LFr+U1u90n+B8vf4d3UEIWnDuntCiOrYriKrDw5r6Ir2N3EXRnmPZK
	K54RdzEOvl+v+lhANxqTKEfKje/0c+lNnVNdwusIABRo3tvwn532/WfHHS1wiU660PC5
	EyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vEsW32E1SVLlER+oBTv6KdFwS0s/P4kF++msdPMsZQs=;
	b=vQ49+Z5d4YPly7he3lYzCKWlrEPk3BKjTg/xUjk7Oy7kbtP0jehgubr9oSfeZfrK5M
	Pf+w4NXiauX5qvgK4ucmAYMD7mD1rqjfffVLN1f7+6EnyW+hbIupif98vaR0iqNMVad9
	AdyxIJzgKOPTftqD36paExxLy3l5ozCALnVABzMY48rFbD4lIEB/QhEv3mKwL0nH4IPL
	e/v49QlkuZQ19KUB/zBlScjK8eDFAFvAG+6DyOV1o/ECsmh76NCdqvOC+gXIZVtIFFc+
	qaS4Qa6kMdc0yQ2dffe055WCE/cikozWy+PFApfatjIF8GyGBwpPChW/3IqnDU2JXr06
	T3hQ==
X-Gm-Message-State: AOAM532+SznLyAp3x45ZkQHdZV3iTbtKkgn1jQvXIy88OwsC9uw6/YwA
	dpE6gnDY0wAsVXNeCq8xGQsw95gAmpL/kPT5jzYtxosU6HVm2w==
X-Google-Smtp-Source: ABdhPJxuvutBqK97UgDkcb3RMQ9JWvJxk40mXBFzxTC4Ip1OxL6PJZcMSAJTTMYCDZ6Hj152G9bqZtDp7R22JmqZgJo=
X-Received: by 2002:a50:ff02:0:b0:418:e736:e003 with SMTP id
	a2-20020a50ff02000000b00418e736e003mr13865566edu.370.1649328503089;
	Thu, 07 Apr 2022 03:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220303071009.1070360-1-rui.xu@easystack.cn>
In-Reply-To: <20220303071009.1070360-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Thu, 7 Apr 2022 12:48:12 +0200
Message-ID: <CAGNP_+VZLZhCuMymZO+qwSDZmFjYgyJHLfsPLwGZaGE+E5cD_Q@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: create new uuid even we dont have
	quorum
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

Hi,

When quorum is configured, we expect not to have split-brain
situations. Hence it is important that we do not generate new UUIDs
until they are definitely necessary. When we do not have quorum, no
writes should complete, so we do not need to generate a new UUID. We
may need to generate one before we regain quorum instead.

That said, there have been various bugs in the implementation. Try to
reproduce your issue with the latest drbd-9.1. If it can still be
reproduced, then describe the exact reproduction steps and we can
discuss the appropriate fix.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
