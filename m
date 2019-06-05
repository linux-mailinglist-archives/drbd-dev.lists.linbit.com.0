Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7D142801
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 15:51:20 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id A548E1045C35;
	Wed, 12 Jun 2019 15:51:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6CD781028A61
	for <drbd-dev@lists.linbit.com>; Wed,  5 Jun 2019 18:14:28 +0200 (CEST)
Received: by mail-io1-f42.google.com with SMTP id u19so4740624ior.9
	for <drbd-dev@lists.linbit.com>; Wed, 05 Jun 2019 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=LooNeVwvuRTDCC1WsA/kysu8vZe51NwkxHZHR4mmL50=;
	b=NhVyM7aLW/xXVGajLOzJAo2aLBtw4QlIYsYR2uO/X1X+Ll6q9WpDMUPGud/dhnNK9b
	I0Sz+1VLSZFRGeDCbN9SnLYgbTa5OY+td2MJV3WNnjjN3xiq0uw0Z2hnbR29rMPc/mBi
	IHYdr4/WcizfmMaPSEymrNQAhKti7t3Ahy1DFTWRADPU2qRFhrJF/nVdnBx7dGyPMb/H
	sjVY6ur5e28gRdE6cDLcKBxm+bSQmiI45tLmEhoepFWhoGjtGzwo0Stpg7pvADUCieIX
	OHjLrUADQAf89x63tbxl6uumNDhSCnBFpJFB+f3vZg5kFY0605HeRtZ81/KAmGHbLdXW
	efCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=LooNeVwvuRTDCC1WsA/kysu8vZe51NwkxHZHR4mmL50=;
	b=dKtZSU8zCKsjSAE/YT28iPstlpPCA7wUiWTmYLlknGAvSvAxyPaN93pHZZBPw1ept4
	vZYSF+TQP6BNs3RB5KjMpySvM+FdaLMC4dwES6l6A6+z1mxtzOqrz+4RLXL1S91Un7bY
	BAG1Rn0E+8fkpkbOkpdMgN+UBTVi1KkdmYvRxcyOb7kRjQ59med2nFWOnXj5X6YUspte
	nC8hEICLzZhAUYelki5MYBy7rf2O0wD/V/GYKSLI3b+hSEFPvzlL4UqlSMrrELGxblUG
	gTdhovHJ8Wg13U5mjlw6OSTTbXxSbmp0a7KiA9N6eQb2Qpm8FYXTiBsENOr5OWdy04PZ
	m2Hw==
X-Gm-Message-State: APjAAAWsLa8IKS6zpD0QnkdrvG6XjqZDuE8IMeUmA2kaH+aOnnQwUfPM
	y4nS9faLsThd9xe8Tnrz6URUcoFV
X-Google-Smtp-Source: APXvYqzWxVoz/5ArRGOnjxvT5slc07ZvwGJe+Fc4VI/N2TyU6yUIcWU8M4q3uK0SzXB6RfY/j0QJjQ==
X-Received: by 2002:a5e:db4b:: with SMTP id r11mr14201375iop.172.1559751267238;
	Wed, 05 Jun 2019 09:14:27 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	k203sm9070618itk.41.2019.06.05.09.14.25
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 09:14:26 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <e9d5ec6e-30e9-9af1-06c3-bcf8b1d92068@gmail.com>
Date: Wed, 5 Jun 2019 10:14:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Jun 2019 15:50:54 +0200
Subject: [Drbd-dev] avoid use of errno as a function parameter name
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Avoid use of errno as an argument name because it is allowed to be a macro such as
    # define errno (*__errno_location ())

diff --git a/drbd_wrappers.h b/drbd_wrappers.h
-static inline blk_status_t errno_to_blk_status(int errno)
+static inline blk_status_t errno_to_blk_status(int _errno)
 {
        blk_status_t status =
-               errno == 0 ? BLK_STS_OK :
-               errno == -ENOMEM ? BLK_STS_RESOURCE :
-               errno == -EOPNOTSUPP ? BLK_STS_NOTSUPP :
+               _errno == 0 ? BLK_STS_OK :
+               _errno == -ENOMEM ? BLK_STS_RESOURCE :
+               _errno == -EOPNOTSUPP ? BLK_STS_NOTSUPP :
                BLK_STS_IOERR;
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
