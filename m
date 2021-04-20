Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DFD366237
	for <lists+drbd-dev@lfdr.de>; Wed, 21 Apr 2021 00:41:07 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE3E44205C9;
	Wed, 21 Apr 2021 00:41:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1359 seconds by postgrey-1.31 at mail19;
	Wed, 21 Apr 2021 00:41:05 CEST
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com
	[192.185.145.187])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1CABE420546
	for <drbd-dev@lists.linbit.com>; Wed, 21 Apr 2021 00:41:05 +0200 (CEST)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
	by gateway32.websitewelcome.com (Postfix) with ESMTP id 20A0080A10
	for <drbd-dev@lists.linbit.com>; Tue, 20 Apr 2021 17:17:27 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
	id YygRljue8b8LyYygRllfM1; Tue, 20 Apr 2021 17:17:27 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IqU1MVnkdAvu7/gdvMsvZ0UoM0R9qMbLSGUvD8bDyo0=;
	b=t25+aD0FWGgg1MTsiBu8RqM+6u
	XuNDC1IGpHeaMXQ/FDcbBb9MwHAKKXpa2IIp5FdKlC8j7gx/qpEGLOMJaAQ9IIh1dRTeNIL+GHg5D
	z/LOitlLpayD8MIOy43peMioMdQ10hUNqBoUve7nB1PQk4caMZgHhiTu6EM+It4TtfBZrdwh/qAVd
	vXLfSVS8p6F3dZAD8VJinwbA200XXf0hQj8m+ydrEL1gZpK4uFCZSy2fkuxIsjIn8Bs0DcPyemfjT
	Cg+K5Mm5OUI7GORV80LtOux+35CHIg2z9zqZP4h8lIsThqBNdGAg3INIlQfcj+4jFFEE7UJy7QBEA
	ScAJRZBQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:50542
	helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
	(envelope-from <gustavo@embeddedor.com>)
	id 1lYygN-001kpE-J7; Tue, 20 Apr 2021 17:17:23 -0500
To: Jens Axboe <axboe@kernel.dk>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<44663f18fb12e39c53b0e69039c98505b7c6d5da.1605896059.git.gustavoars@kernel.org>
	<ba77fcbe-8770-d234-509b-7dc5ac079319@embeddedor.com>
	<2c942833-ae0f-bda5-b023-e2a1860be50f@kernel.dk>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <6610a212-6095-0527-c260-49bb2637b7f4@embeddedor.com>
Date: Tue, 20 Apr 2021 17:17:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2c942833-ae0f-bda5-b023-e2a1860be50f@kernel.dk>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linbit.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lYygN-001kpE-J7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
	[187.162.31.110]:50542
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 23
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: linux-block@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 027/141] drbd: Fix fall-through warnings for
	Clang
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



On 4/20/21 16:23, Jens Axboe wrote:

> Applied, thanks.

Awesome. :)

Thanks
--
Gustavo
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
