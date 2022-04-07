Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6055B4F7C4E
	for <lists+drbd-dev@lfdr.de>; Thu,  7 Apr 2022 12:02:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4066E42101F;
	Thu,  7 Apr 2022 12:02:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 37B41421019
	for <drbd-dev@lists.linbit.com>; Thu,  7 Apr 2022 12:02:28 +0200 (CEST)
Received: by mail-ed1-f50.google.com with SMTP id g20so5782155edw.6
	for <drbd-dev@lists.linbit.com>; Thu, 07 Apr 2022 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wDxCx1u4F6e2OY2Fv7LkzTUa+/AM50dLcS3/UcnjVmU=;
	b=GlQwL/m9GKClY8d4ZYFDAaa5WRLjRbD4j9SXI7P55GLJJWd7WV3CHrznzMnYzZ8GtN
	+TteOO72Q/qDrEb3QxMwiOrFRnurVM1+6LPVy7DNddEIiexIK6qDpPTINpX80uBGnBK+
	xNzvJ+gQIzRy4B1EuJXk8nSBTpjFbdqmyMgFrQoXI3DwvUQLTRQynsL6Ay72ScEgUPs1
	vktpA3XcQ1/fU4eAuFVz2M8f+4s8rFAHdmfZL5un/XhOcTTRwhwY4QlIToDffR29ULMJ
	fTVb6rMk4rDX7YFdYvxyw3/nIxNLVYZG7Il9men1FAKzoO6SeuzTeWyIEB7vuMff7BsE
	DG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wDxCx1u4F6e2OY2Fv7LkzTUa+/AM50dLcS3/UcnjVmU=;
	b=DnNlwcbUfp7j46FICzifCwW9mmHY6UHnu0qKwIs/qbG2TCMZ7LvPVCZrPp0+ey1ymz
	gCAoihC8Ios3xDBWADHBqgNe2qn4sg5efSrTH2kMoXFom5ALpnrI/s5i02zEJvl1hecD
	Zqs8janW4Y4Oc+cQWhFo5xTxy3rwIjfNI9nkdOwxL9jbzzuwZks5AUNru2bl7S7Wm4+v
	41nd8SI0c3PJeJJmTro+x7boI55b+nLboz/1ocE7nEj+dGFV4ppRHOkb++v/xbKYInIf
	oHXC/qP+FaZ745JXAUDVgBojJmqYzcgS6Vhg8uWGtWgNYo39pzmrGpeOtQHKXNv7JPCg
	xI0g==
X-Gm-Message-State: AOAM5329Hx+QHZQ7bzOwGqR4ixgV0gqe+MXhN2LV3WbBnGr4yJwtXGTW
	JfCR47VrUZ4uESq3O2K/AgscvKgaryZXsX/TKRR5LW2k
X-Google-Smtp-Source: ABdhPJyhQCVHsRiSNVBfESs4cqT0PsM5x8z7qUMa9HKWtvN8sgrstZf300T1Fu98GnbJl/ScZbIKaL+OS7EvjBaCdPw=
X-Received: by 2002:a50:ee05:0:b0:419:39d9:ccd8 with SMTP id
	g5-20020a50ee05000000b0041939d9ccd8mr13346248eds.369.1649325747807;
	Thu, 07 Apr 2022 03:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220223084442.3312409-1-rui.xu@easystack.cn>
	<AJ*A6wDEId6nn-rl7MpNZapM.3.1648177318891.Hmail.rui.xu@easystack.cn>
In-Reply-To: <AJ*A6wDEId6nn-rl7MpNZapM.3.1648177318891.Hmail.rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Thu, 7 Apr 2022 12:02:17 +0200
Message-ID: <CAGNP_+UpeqaLU6bLVBOqORB+k0E=joO9nnTW5JFpmHBZ_pNTgw@mail.gmail.com>
To: Xu Rui <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: fix a bug of do_change_disk_state when
	attach
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

The patch looks plausible but the commit message is hard to
understand. Please split the 8 line sentence into multiple sentences.
Also explain at the start which versions need to be mixed to trigger
this bug.

Regarding versions - it looks like you have a 3 node cluster where one
node is running DRBD 8. This is not recommended. What is your
use-case?

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
