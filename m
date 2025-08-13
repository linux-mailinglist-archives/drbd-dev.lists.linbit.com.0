Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 60797B24508
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Aug 2025 11:08:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EA38E1626EF;
	Wed, 13 Aug 2025 11:08:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 535 seconds by postgrey-1.31 at mail19;
	Wed, 13 Aug 2025 11:08:31 CEST
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0168B16225B
	for <drbd-dev@lists.linbit.com>; Wed, 13 Aug 2025 11:08:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78630601D3;
	Wed, 13 Aug 2025 08:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701F8C4CEEB;
	Wed, 13 Aug 2025 08:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755075575;
	bh=XmgEE2r9/03Htllgcwpg18c5MfZ8FEI0JOAF6sFxxKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EFu5YI9mwImluA2LuTvGgHPMWyR/bSWgPuEhbfBznuDalHg4kTg+x0roHajv5AHg4
	D32HX/mrgpBryIOnX5aP/C+ChyZzzknuJrJlFWqhgFfUcmFpjHw1N3ZZ1UobJXGNMD
	YpoxbqZ7vcYXwjGi2VlcV0eQqgN3pnMMgGgrkUL3tcY0ImqL5zpQ7w6XAz6wY6wGcJ
	SF1yCyB4cBg3HrLdQLnlxB1yfLiiXg/rCEHS3z1YtA7YEWMeww9xARP4xkq1U/rb6q
	lI4HTQdA6ERBEayxeYrD6XYWW19PCgC78Jkw1bxmtmxRib7oXl/5hasQVnsnTfJsZP
	yD3XvXnlc8tsg==
Message-ID: <066729ba-bd9a-4328-a813-9ef73620020c@kernel.org>
Date: Wed, 13 Aug 2025 17:59:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs: admin-guide: Correct spelling mistake
To: Erick Karanja <karanja99erick@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Jonathan Corbet <corbet@lwn.net>
References: <20250813071837.668613-1-karanja99erick@gmail.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250813071837.668613-1-karanja99erick@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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

On 8/13/25 16:18, Erick Karanja wrote:
> Fix spelling mistake directoy to directory
> 
> Reported-by: codespell
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
