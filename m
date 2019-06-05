Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 35639427FD
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 15:51:09 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 3DF81103B4CA;
	Wed, 12 Jun 2019 15:50:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id F30DA1028A61
	for <drbd-dev@lists.linbit.com>; Wed,  5 Jun 2019 18:02:55 +0200 (CEST)
Received: by mail-io1-f47.google.com with SMTP id w25so20586062ioc.8
	for <drbd-dev@lists.linbit.com>; Wed, 05 Jun 2019 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=nFBzt4EBgBV1D4HEMtyU3M0IqGNzTsb7FEyit1QoNjs=;
	b=YeNZd63xcVLWulqCgZqSRxwCbI1jYf0znUDzu5qgTcE8yJXf9nc4RiNKXfO6S4wyQT
	5TJcS9zWZhmxSM+WRpkGRRibu7mkZW5pTJgJ02rCFn0ZEGkT3X2WqGT+N9hIyzo5d2Tb
	xFEx2qASLlSnoxt8yqLWdyqtNuVYMvPmuU95rU6uWU4yX/Q2lu57hZKa9DuJZzt3WLhK
	3j8qjuHUNZ6pb85gmc9O0qweHo2FqJgpMKKw4NgUPCyQSYW2VeT67wdaUhtqR+H0bx+f
	NCUT7231DwE4SKWAuKrg4aEGbtXJ3yCCtbbDF4tiRodhHIsjwTLbNNYa0fzkNmhyfgPj
	Yw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=nFBzt4EBgBV1D4HEMtyU3M0IqGNzTsb7FEyit1QoNjs=;
	b=CZ8o32zmMw7ZLDnjCGWmpHaF9ozQ3lEKWvaT380qGgUOXdZYFQfsyZRZja1Lh6QzKa
	DTBaC/B1q0M5mbC5SmCXWoU/6f7N6bFk2Q89Dx2+zOpNRcCR9fo2VPieIPzvBVEfwHXZ
	J52jw5xSCJO/Jum1zSyDNvHXH4u3eea4x7xu2VJzamGJBDHE/kX81PPLPaU1d4ifrIXX
	kwbHBthIh/Modpe6JlybmKt2lv7g+t5c1Kblf0zDIm34WHzF3sVQ0tGUQR4l5pmP+lF2
	naZO8HikK2Xzsj98+huzsf+rzOC43n7pbA+jeecV5u7yfMDh3WoUjBQwB4n4KFx0SsCS
	70qA==
X-Gm-Message-State: APjAAAW/TFXFQ7izmMcn8A3gJyeZpv5gqei9Dechdw4b59pkmNGzxtAr
	yfroWbgHP/I8UNCiEUL6lh5Sdd2u
X-Google-Smtp-Source: APXvYqzMsE7TxqONG16GvOmH3XNCTLBTJb1ml33N1bXLb2r/rw6qAHR9JoRXDrS8GcQOfEIH1mUCHA==
X-Received: by 2002:a05:6602:1c7:: with SMTP id
	w7mr4031180iot.146.1559750574826; 
	Wed, 05 Jun 2019 09:02:54 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191])
	by smtp.gmail.com with ESMTPSA id 3sm9562258itu.29.2019.06.05.09.02.54
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 09:02:54 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <ca8b7f92-efce-dc39-ddf0-7e0dee15c5b6@gmail.com>
Date: Wed, 5 Jun 2019 10:02:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Jun 2019 15:50:54 +0200
Subject: [Drbd-dev] missing newline in call to drbd_info() from
 change_cluster_wide_state()
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

In drbd_state.c:change_cluster_wide_state() there is a drbd_info() call with a missing newline:

@@ -4164,7 +4164,7
        request.mask = cpu_to_be32(context->mask.i);
        request.val = cpu_to_be32(context->val.i);

-       drbd_info(resource, "Preparing cluster-wide state change %u (%u->%d %u/%u)",
+       drbd_info(resource, "Preparing cluster-wide state change %u (%u->%d %u/%u)\n",
                  be32_to_cpu(request.tid),
                  resource->res_opts.node_id,
                  context->target_node_id,

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
